require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry-byebug')

Customer.delete_all
Film.delete_all
Screening.delete_all
Ticket.delete_all

customer1 = Customer.new({"name" => "Brendan", "funds" => 100.00})
customer1.save
customer2 = Customer.new({"name" => "Debbie", "funds" => 100.00})
customer2.save
customer3 = Customer.new({"name" => "Grant", "funds" => 100.00})
customer3.save

film1 = Film.new({"title" => "Joker", "price" => 10.00})
film1.save

screening1 = Screening.new({"film_id" => film1.id, "time" => "19:00"})
screening1.save

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id, "screening_id" => screening1.id})
ticket1.save

binding.pry
nil
