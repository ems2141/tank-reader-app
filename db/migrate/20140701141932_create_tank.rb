class CreateTank < ActiveRecord::Migration
  def change
    create_table :tanks do |t|
      t.string :name
      t.integer :station_id
    end
  end
end
