class Carte < ActiveRecord::Base
  belongs_to :carte_type
  belongs_to :edition
  has_attached_file :image, :styles => { :medium => "250x400>", :thumb => "125x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.search(query)
    if query
      token = "%#{query.downcase}%"
      where("LOWER(libelle) LIKE ?", token)
    else
      all
    end
  end

end
