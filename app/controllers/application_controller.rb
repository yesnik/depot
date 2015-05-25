# encoding: utf-8
class ApplicationController < ActionController::Base
  before_action :authorize
  before_filter :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Метод нужен для поддержки генерации URL-ов, соответствующих локали,
  # хелпером link_to
  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: t('app.controllers.session.messages.authorize_please')
    end
  end

  private

  # Этот метод доступен только контроллерам
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end

