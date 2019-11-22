require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')
require_relative('models/screening')

require('pry-byebug')

customer1 = Customer.new({"name" => "Brendan", "funds" => 100.00})
customer1.save 
