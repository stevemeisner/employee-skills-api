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
    start_date: Faker::Date.between(from: 7.years.ago, to: Date.today),
    field_start_date: Faker::Date.between(from: 20.years.ago, to: Date.today),
  ).save
end

Employee.all.each do |employee_id|
  e = Employee.find(employee_id.id)
  e.skill_list.add(Faker::ProgrammingLanguage.name, Faker::ProgrammingLanguage.name, Faker::ProgrammingLanguage.name, Faker::ProgrammingLanguage.name)
  e.save
end
