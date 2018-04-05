class StoreController < ApplicationController
  include CurrentCart
  
  before_action :set_cart
  before_action :update_visits_counter, only: [:index]

  skip_before_action :authorize

  def index
    session[:visits_counter] = 0 if visits_counter > 10

    if visits_counter > 5
      return render plain: visits_counter
    end

    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.where(locale: I18n.locale).order(:title)
    end
  end

  protected

  def update_visits_counter
    session[:visits_counter] ||= 0
    session[:visits_counter] += 1
  end

  def visits_counter
    session[:visits_counter] || 0
  end
end
