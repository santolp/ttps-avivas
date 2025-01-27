class ProductosController < ApplicationController
  before_action :set_producto, only: %i[ show edit update destroy ] 
  #before_action :authenticate_user!
  

  # GET /productos or /productos.json
  def index
    @productos = Producto.where("stock >= 1")
  end

  # GET /productos/1 or /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos or /productos.json
  def create
    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: "Producto creado con exito." }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1 or /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: "Producto actualizado con exito." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1 or /productos/1.json
  def destroy
    @producto.destroy!

    respond_to do |format|
      format.html { redirect_to productos_path, status: :see_other, notice: "Producto was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def producto_params
      params.expect(producto: [ :name, :description, :unit_price, :stock, :category, :size, :color, :date_in_stock, :last_update, :delete_date, images: [] ])
    end
end
