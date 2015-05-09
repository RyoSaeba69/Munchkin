class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.string :libelle

      t.timestamps
    end
  end
end
