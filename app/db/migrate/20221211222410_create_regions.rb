class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions do |t|
      t.integer :ddd, null: false, default: ''
      t.string :name, null: false, default: ''

      t.timestamps
    end
  end
end
