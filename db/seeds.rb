# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def new_customer

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    customer = Customer.create!(
                            first_name: first_name, 
                            last_name: last_name, 
                            email: "#{first_name}.#{last_name}@mail.com"
                            )
  
    3.times do 
        Product.create!(
                    price: rand(10000..50000),
                    label: Faker::Vehicle.make_and_model
                    )
    end
    
    address = Address.new(address_line1:Faker::Address.street_address,
                        address_line2:Faker::Address.secondary_address,
                        address_city:Faker::Address.city,
                        country: Faker::Address.country
                        )
    address.customer_id = customer.id
    address.save!


    rand(1..10).times do
        new_order = Order.new(
                    status: ["being processed", "in transit", "delivered"].sample
                    )
        new_order.product_id = Product.order('RANDOM()').first.id
        new_order.customer_id = customer.id
        new_order.save!
    end

end



50.times do 
  new_customer
end