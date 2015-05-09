class Edition < ActiveRecord::Base
  has_many :cartes
  has_many :compteurs
  has_attached_file :icon, :styles => { :thumb => "50x50>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  def self.search(query)
    if query
      token = "%#{query.downcase}%"
      where("LOWER(libelle) LIKE ?", token)
    else
      all
    end
  end
end
