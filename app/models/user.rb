class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  after_destroy :ensure_an_admin_remains
  
  has_secure_password

  class RemovingLastUserError < StandardError; end

  protected

  def ensure_an_admin_remains
    if User.count.zero?
      raise RemovingLastUserError.new 'Cannot delete last user'
    end
  end
end
