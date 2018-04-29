class AddVictimIdToShootings < ActiveRecord::Migration[5.2]
  def change
    add_reference :shootings, :victim, foreign_key: true
  end
end
