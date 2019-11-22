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

end
