class AddUserToRegions < ActiveRecord::Migration[5.2]
  def change
    add_reference :regions, :user, foreign_key: true
  end
end
