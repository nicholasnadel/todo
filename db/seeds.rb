require 'faker'

# Create todo lists
50.times do
  TodoList.create(
    todo_item:  Faker::Lorem.sentence,
    content:   Faker::Lorem.paragraph 
  )
end
tasks = Task.all #unsure about this 


puts "Seed finished"
puts "#{TodoList.count} tasks created"
