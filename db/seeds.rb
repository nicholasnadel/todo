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

# Create an admin user
admin = User.new(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

admin.skip_confirmation!
admin.save!

User.first.update_attributes!(
  email: 'nicholasnadel@gmail.com',
  password: 'M0nepenny'
)


puts "Seed finished"
puts "#{TodoList.count} tasks created"
