require 'faker'

# Create todo lists
  list = TodoList.create( 
    title:  Faker::Lorem.sentence,
    description:   Faker::Lorem.paragraph 
  )

  TodoItem.create(
  	content: "here is some text",
  	todo_list: list
  	)


puts "Seed finished"
puts "#{TodoList.count} tasks created"
