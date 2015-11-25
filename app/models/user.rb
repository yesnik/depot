# coding: utf-8
class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"},
                             default_url: ":style/user_avatar_missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

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
