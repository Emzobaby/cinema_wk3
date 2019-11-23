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
film2 = Film.new({"title" => "Doctor Sleep", "price" => 10.00})
film2.save
film3 = Film.new({"title" => "Star Wars", "price" => 10.00})
film3.save

screening1 = Screening.new({"film_id" => film1.id, "time" => "19:00"})
screening1.save
screening2 = Screening.new({"film_id" => film2.id, "time" => "20:00"})
screening2.save
screening3 = Screening.new({"film_id" => film3.id, "time" => "21:00"})
screening3.save
screening4 = Screening.new({"film_id" => film3.id, "time" => "22:00"})
screening4.save
screening5 = Screening.new({"film_id" => film3.id, "time" => "23:00"})
screening5.save
screening6 = Screening.new({"film_id" => film3.id, "time" => "24:00"})
screening6.save

ticket1 = Ticket.new({"customer_id" => customer1.id, "film_id" => film1.id, "screening_id" => screening1.id})
ticket1.save
ticket2 = Ticket.new({"customer_id" => customer1.id, "film_id" => film2.id, "screening_id" => screening2.id})
ticket2.save
ticket3 = Ticket.new({"customer_id" => customer2.id, "film_id" => film1.id, "screening_id" => screening1.id})
ticket3.save
ticket4 = Ticket.new({"customer_id" => customer2.id, "film_id" => film3.id, "screening_id" => screening3.id})
ticket4.save
ticket5 = Ticket.new({"customer_id" => customer2.id, "film_id" => film3.id, "screening_id" => screening3.id})
ticket5.save
ticket6 = Ticket.new({"customer_id" => customer3.id, "film_id" => film3.id, "screening_id" => screening4.id})
ticket6.save

binding.pry
nil
