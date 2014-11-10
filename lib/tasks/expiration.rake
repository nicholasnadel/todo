task delete_todo_items: :environment do
  TodoItem.where("created_at <= ?", Time.now - 1.days).destroy_all
  echo "#{Time.now}: Deleted todos"
