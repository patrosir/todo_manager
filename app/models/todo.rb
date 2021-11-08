class Todo < ApplicationRecord
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{todo_text} #{is_completed}"
  end

  def self.overdue
    where("due_date < ?", Date.today)
  end

  def self.due_today
    where("due_date = ?", Date.today)
  end

  def self.due_later
    where("due_date > ?", Date.today)
  end

  def self.completed
    all.where(completed: true)
  end
end
