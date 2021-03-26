# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.destroy_all

FactoryBot.create(:employee, email: 'employee@example.com', password: 'employee')

manager = FactoryBot.create(:manager, email: 'manager@example.com', password: 'manager')

FactoryBot.create(:employee, manager: manager)
FactoryBot.create(:employee, manager: manager)

admin = FactoryBot.create(:admin, email:'admin@example.com', password:'admin')
