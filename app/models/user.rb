class User < ActiveRecord::Base
  has_one :todo_list
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
