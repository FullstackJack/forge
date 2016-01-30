class ChangeUserRoleColumnToInteger < ActiveRecord::Migration
  def change
    change_column :forgecms_users, :role, :integer
  end
end
