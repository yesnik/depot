# encoding: utf-8
class ReviewsController < ApplicationController
  # Позволяем неавторизованным юзерам создавать отзывы
  skip_before_action :authorize, only: [:create]

  def create
    @product = Product.find params[:product][:id]
    @review = @product.reviews.build(review_params)
    unless @review.save
      flash[:error] = 'В комментарии должны быть указаны Автор и Текст комментария'
    end
    redirect_to product_url params[:product][:id]
  end

  def review_params
    params.require(:review).permit(:author, :text)
  end
end
