require_relative('../db/sql_runner')

class Screening

  attr_accessor :time
  attr_reader :id, :film_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @time = options["time"]
  end

end
