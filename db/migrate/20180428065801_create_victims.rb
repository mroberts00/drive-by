class CreateVictims < ActiveRecord::Migration[5.2]
  def change
    create_table :victims do |t|
      t.string :name
      t.integer :age
      t.boolean :dead

      t.timestamps
    end
  end
end
