class UpdateUsersSetApprovedTrue < ActiveRecord::Migration
  def change
    User.reset_column_information
    User.update_all approved: true
  end
end
