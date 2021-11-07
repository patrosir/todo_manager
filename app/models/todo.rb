class Todo < ApplicationRecord
    def to_pleasant_string
        is_completed = completed ? "[X]" : "[ ]"
        "#{id}. #{todo_text} #{is_completed}"
    end
end