# encoding: utf-8
module CartsHelper
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    logger.error "Попытка доступа к несуществующей корзине #{params[:id]}"
    redirect_to store_index_url, notice: "Несуществующая корзина №#{params[:id]}"
  else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end
end
