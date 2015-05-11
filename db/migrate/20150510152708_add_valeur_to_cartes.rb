class AddValeurToCartes < ActiveRecord::Migration
  def change
    add_column :cartes, :valeur, :integer
  end
end
