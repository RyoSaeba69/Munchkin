class AddEditionToCartes < ActiveRecord::Migration
  def change
    add_reference :cartes, :edition, index: true
  end
end
