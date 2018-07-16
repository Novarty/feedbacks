class AddIndexToFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_index :feedbacks, :name
    add_index :feedbacks, :email
  end
end
