require_relative('../db/sql_runner')

class Screening

  attr_accessor :time
  attr_reader :id, :film_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @time = options["time"]
  end

  def save
    sql = "INSERT INTO screenings (film_id, time) VALUES ($1, $2)
    RETURNING id"
    values = [@film_id, @time]
    result = SqlRunner.run(sql, values)[0]
    @id = result["id"].to_i
  end

  def self.delete_all
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT*FROM screenings"
    screenings = SqlRunner.run(sql)
    return screenings.map { |screening| Screening.new(screening)}
  end

  def delete
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
