class CreateTreasureHunts < ActiveRecord::Migration[6.1]
  def change
    create_table :treasure_hunts do |t|
      t.float :current_location, array: true, default: []
      t.string :email
      t.float :distance
      t.boolean :winner, default: false

      t.timestamps
    end
  end
end
