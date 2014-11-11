class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  default_scope { order('created_at DESC') }

  def completed?
  	!completed_at.blank?
  end
end
