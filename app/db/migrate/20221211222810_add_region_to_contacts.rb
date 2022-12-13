class AddRegionToContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :region, foreign_key: true
  end
end
