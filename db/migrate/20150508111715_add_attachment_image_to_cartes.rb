class AddAttachmentImageToCartes < ActiveRecord::Migration
  def change
    change_table :cartes do |t|
      t.attachment :image
    end
  end
end
