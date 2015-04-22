# encoding: utf-8
class CartsController < ApplicationController
  # Разрешим неавторизованному юзеру создавать, обновлять и удалять корзины
  skip_before_action :authorize, only: [:create, :update, :destroy]

  before_action :set_cart, only: [:show, :edit]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    
    #set_cart
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    @cart = current_cart
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.js
      format.html { redirect_to store_index_url }
      format.json { head :ok }
    end
  end

  private
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart] || {}
    end
end
