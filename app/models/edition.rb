class Edition < ActiveRecord::Base
  has_many :cartes
  has_many :compteurs
end
