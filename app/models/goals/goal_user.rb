module Goals
  class GoalUser < ActiveRecord::Base

    belongs_to :goal
    belongs_to :user

    structure do
      completed_at DateTime.now
      timestamps
    end

    def completed?
      completed_at.present?
    end

  end

end
