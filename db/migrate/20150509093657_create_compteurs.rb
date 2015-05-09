class CreateCompteurs < ActiveRecord::Migration
  def change
    create_table :compteurs do |t|
      t.string :libelle
      t.references :edition, index: true

      t.timestamps
    end
  end
end
