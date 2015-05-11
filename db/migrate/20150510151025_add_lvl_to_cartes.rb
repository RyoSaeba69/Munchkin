class AddLvlToCartes < ActiveRecord::Migration
  def change
    add_column :cartes, :niveau, :integer
    add_column :cartes, :tresor, :integer
    add_column :cartes, :incident, :string
  end
end
