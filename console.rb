require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry-byebug')

Customer.delete_all
Film.delete_all
Screening.delete_all

customer1 = Customer.new({"name" => "Brendan", "funds" => 100.00})
customer1.save

film1 = Film.new({"title" => "Joker", "price" => 10.00})
film1.save

screening1 = Screening.new({"film_id" => film1.id, "time" => "19:00"})
screening1.save
