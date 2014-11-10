class TodoList < ActiveRecord::Base
	has_many :todo_items
	belongs_to :user

	default_scope { order('created_at DESC') }
end
