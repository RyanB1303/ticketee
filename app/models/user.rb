class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :active, -> { where(:archived_at => nil)}
  # Ex:- scope :active, -> {where(:active => true)}
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end
  
  def archive!
    self.update(archived_at: Time.now)
  end
  
  def active_for_authentication?
    super && archived_at.nil?
  end
  
  def inactive_message
    archived_at.nil? ? super : :archived
  end
  
end
