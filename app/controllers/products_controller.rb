class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # Пропускаем авторизацию для страницы товара
  skip_before_action :authorize, only: [:show]
  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @reviews = @product.reviews.order('created_at')
    @review = @product.reviews.build
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: I18n.t('app.models.created') }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update_attributes(product_params)
        format.html { redirect_to @product, notice: I18n.t('app.models.updated') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, notice: 'Product was not updated!' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  rescue ActiveRecord::StaleObjectError
    @product.reload
    render :action => 'conflict'    
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    if @product.destroy
      message = I18n.t 'app.notice.destroyed'
    else
      message = (I18n.t 'app.notice.not_destroyed') + ': ' +
        @product.errors.full_messages.first
    end
    respond_to do |format|
      format.html { redirect_to products_url, notice: message }
      format.json { head :no_content }
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    @latest_order = @product.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
        format.html
        format.json { render :json => @product.to_json(include: :orders) }
        format.xml { render :xml => @product.to_xml(include: :orders) }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, 
        :image_url, :price, :lock_version, :terms_of_service, :locale)
    end
end
