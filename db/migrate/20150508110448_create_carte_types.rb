class CreateCarteTypes < ActiveRecord::Migration
  def change
    create_table :carte_types do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
