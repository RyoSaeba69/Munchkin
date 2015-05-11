class AddPrecombatToCartes < ActiveRecord::Migration
  def change
    add_column :cartes, :precombat, :string
  end
end
