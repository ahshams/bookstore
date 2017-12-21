class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  #attr_accessor :password, :password_digest
  has_secure_password

  after_destroy :ensure_an_admin_remains

  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
end
