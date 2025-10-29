class AddCustomTimestamp < ActiveRecord::Migration[8.0]
  def change
    add_column :estates, :custom_timestamp, :timestamp
  end
end
