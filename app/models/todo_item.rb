class TodoItem < ActiveRecord::Base
  belongs_to :todo_list

  default_scope { order('created_at DESC') }

  def completed?
  	!completed_at.blank?
  end

  def expires_at
  created_at + 1.week
  end

  def days_remaining
    days_left =  7 - (Date.today - self.created_at.to_date).to_i
  end
end
