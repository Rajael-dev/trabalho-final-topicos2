class AddIsadminToUsers < ActiveRecord::Migration[5.2]
  def change
    if table_exists? 'users'
      unless column_exists? 'users', :is_admin
        add_column 'users', :is_admin, :integer, comment: 'Identifica se é administrador'
      end
    end
  end
end
