require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Employee.delete_all

employees = JSON.parse(File.read("#{Rails.root}/db/seeds.json")).each do |employee|
  Employee.new(
    first_name: employee['first_name'],
    last_name: employee['last_name'],
    start_date: DateTime.strptime(employee['start_date'], '%m/%d/%y'),
    field_start_date: DateTime.strptime(employee['field_start_date'], '%m/%d/%y'),
  ).save
end
