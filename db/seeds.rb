# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username:"bbb", email:"bbb@bbb.com", password:"123", balance:"5000")
u2 = User.create(username:"abc", email:"abc@bbb.com", password:"123", balance:"5000")

t1 = Trade.create(stock_symbol:"AAPL", price:"200.02", quantity:10)
t2 = Trade.create(stock_symbol:"AAPL", price:"200.02", quantity:100)
t3 = Trade.create(stock_symbol:"MSFT", price:"210.02", quantity:20)
t4 = Trade.create(stock_symbol:"INTC", price:"202.02", quantity:30)

u1.trades << t1
u1.trades << t2

u2.trades << t3
u2.trades << t4

s1 = Stock.create(stock_symbol:"AAPL", quantity:110, user:u1)
s2 = Stock.create(stock_symbol:"MSFT", quantity:20, user:u2)
s3 = Stock.create(stock_symbol:"INTC", quantity:30, user:u2)
