class CreateShootings < ActiveRecord::Migration[5.2]
  def change
    create_table :shootings do |t|
      t.string :weapon
      t.string :location
      t.string :vehicle

      t.timestamps
    end
  end
end
