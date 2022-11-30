# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
inpt = InputValue.create(input: 15)
# inpt = InputValue.last
# t = inpt.Twin.create(17, 19)
p inpt
t = inpt.twins.create(first: 1, second: 2)
values = [15, 17]
