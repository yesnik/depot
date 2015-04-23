# encoding: utf-8
class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  def valid_password?(password)
    BCrypt::Password.create(password) == password_digest
  end

  private

  # Убедимся, что в БД остался хоть один админ после удаления юзера
  def ensure_an_admin_remains
    if User.count.zero?
      raise t('activerecord.errors.models.user.messages.cant_delete_last_user')
    end
  end
end
