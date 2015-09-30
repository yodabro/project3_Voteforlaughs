class User < ActiveRecord::Base
  has_secure_password
  has_many :comedians, through: :follows, dependent: :destroy
  has_many :cities, through: :votes, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :votes, dependent: :destroy

  enum role: [:user, :comedian, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  has_attached_file :image, styles: {
    small: "64x64",
    med: "200x200",
    large: "400x400"
  }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
