class AddTypeToExstingFeedback < ActiveRecord::Migration

  def change
    reversible do |dir|
      dir.up do
        Feedback.update_all type: 'debrief'
      end
    end
  end

end
