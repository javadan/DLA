module Goals
  class Goal < ActiveRecord::Base

    structure do
      type 'Goal::Goals::UserEnrolment', index: true
      deadline Time.now
      timestamps
    end

  end

end
