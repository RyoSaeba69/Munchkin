class AddAttachmentIconToEditions < ActiveRecord::Migration
  def self.up
    change_table :editions do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :editions, :icon
  end
end
