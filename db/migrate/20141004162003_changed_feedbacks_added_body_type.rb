class ChangedFeedbacksAddedBodyType < ActiveRecord::Migration
  def self.up
    add_column :feedbacks, :body, :text
    add_column :feedbacks, :type, :string
  end
  
  def self.down
    remove_column :feedbacks, :body
    remove_column :feedbacks, :type
  end
end
