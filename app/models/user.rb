class User < ActiveRecord::Base
  has_many :todo_lists  #should obviously be has_one as per bloc's expectations
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
