class CreateFamilleCartes < ActiveRecord::Migration
  def change
    create_table :famille_cartes do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
