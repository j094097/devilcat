class CreateEstates < ActiveRecord::Migration[8.0]
  def change
    create_table :estates do |t|
      t.timestamps
    end
  end
end
