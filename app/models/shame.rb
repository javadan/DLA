class Shame < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  structure do
    timestamps
  end
end

