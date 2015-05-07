class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :approved, -> { where(approved: true) }
  scope :not_approved, -> { where(approved: false) }
  validates :username,
            :uniqueness => {
                :case_sensitive => false
            },
            :presence => true


  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def active_for_authentication?
    super && approved?
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions).first
    end
  end
  def inactive_message
    approved? ? super : :not_approved
  end
  def self.find_all_by_approved(bool)
    return where(:approved => bool)
  end
end
