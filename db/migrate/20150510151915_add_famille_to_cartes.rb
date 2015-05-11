class AddFamilleToCartes < ActiveRecord::Migration
  def change
    add_reference :cartes, :famille_carte, index: true
  end
end
