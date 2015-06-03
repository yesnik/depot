class StoreController < ApplicationController
  # Пропускаем авторизацию для страницы товаров
  skip_before_action :authorize

  def index
    @products = Product.where(locale: I18n.locale).order(:title)
    @cart = current_cart
  end
end
