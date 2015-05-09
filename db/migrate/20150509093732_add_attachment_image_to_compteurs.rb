class AddAttachmentImageToCompteurs < ActiveRecord::Migration
  def self.up
    change_table :compteurs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :compteurs, :image
  end
end
