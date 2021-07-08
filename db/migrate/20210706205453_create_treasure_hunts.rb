class CreateTreasureHunts < ActiveRecord::Migration[6.1]
  def change
    create_table :treasure_hunts do |t|
      t.float :latitude
      t.float :longitude
      t.string :email
      t.float :distance
      t.boolean :winner, default: false

      t.timestamps
    end
  end
end
