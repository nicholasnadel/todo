task delete_todo_items: :environment do
  TodoItem.where("created_at <= ?", Time.now - 7.days).destroy_all
  echo "#{Time.now}: Deleted todos"
end
