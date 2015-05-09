class CreateCartes < ActiveRecord::Migration
  def change
    create_table :cartes do |t|
      t.string :libelle
      t.references :carte_type, index: true

      t.timestamps
    end
  end
end
