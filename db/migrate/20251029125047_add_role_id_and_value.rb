class AddRoleIdAndValue < ActiveRecord::Migration[8.0]
  def change
     add_column :estates, :role_id, :integer
     add_column :estates, :value, :float
  end
end
