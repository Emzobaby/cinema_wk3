require_relative('../db/sql_runner')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"]
  end

  def save
    sql = "INSERT INTO films (title, price) VALUES ($1, $2)
    RETURNING id"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)[0]
    @id = result["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT*FROM films"
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film)}
  end

  def delete
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def customers
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON customers.id = customer_id
    WHERE film_id = $1"
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map { |customer| Customer.new(customer)}
  end

  def price
    sql = "SELECT price FROM films WHERE title = $1"
    values = [@title]
    return SqlRunner.run(sql, values)[0]["price"].to_i
  end

  def customer_count
    return self.customers.count
  end

  def tickets
    sql = "SELECT*FROM tickets WHERE film_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    return tickets.map { |ticket| Ticket.new(ticket)}
  end

  def most_popular_screening_time
    # return the tickets sold for this film
    tickets = self.tickets
    # Loop through the tickets to get the screenings
    screenings = tickets.map { |ticket| ticket.screening_id }
    # Find the screening with the highest frequency
    frequency = screenings.inject(Hash.new(0)) { |h,v| h[v] += 1; h } # I got these 2 lines from stack overflow!
    popular_screening = frequency.max_by { |v| frequency[v] } # I got these 2 lines from stack overflow!
    screening = popular_screening[0].to_i
    sql = "SELECT time FROM screenings WHERE id = $1"
    values = [screening]
    return SqlRunner.run(sql, values)[0]["time"]
  end

end
