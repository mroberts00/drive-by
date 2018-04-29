class AddShootingIdToVictim < ActiveRecord::Migration[5.2]
  def change
    add_reference :victims, :shooting, foreign_key: true
  end
end
