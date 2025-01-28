class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy ]  
  before_action :set_product, only: [:create]

  # GET /purchases or /purchases.json
  def index
    @purchases = Purchase.all
    @users = User.all
    @productos = Producto.all
    
  end

  # GET /purchases/1 or /purchases/1.json
  def show      
    @producto = Producto.find(@purchase.producto_id).name      
    @user = User.find(@purchase.user_id).email
  end

  # GET /purchases/new
  def new
    @productos = Producto.where("stock >= 1")
    @purchase = Purchase.new    
        
  end

  def edit
    @productos = Producto.all 
  end

  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)  
    @purchase.user_id = current_user.id

    if @producto.nil?
      redirect_to purchases_path, alert: "Producto no encontrado."
      return
    end

    if @producto.stock < @purchase.cantidad
      redirect_to purchases_path, alert: "Stock insuficiente para completar la venta." and return
    end
    
    @purchase.fecha_venta = Time.now

    ActiveRecord::Base.transaction do
      @producto.decrement_stock!(@purchase.cantidad) 
      if @purchase.save
        redirect_to purchases_path, notice: "Compra realizada con éxito. Stock actualizado."
      else
        raise ActiveRecord::Rollback, "Error al guardar la compra."
      end
    end
    
  end

  # PATCH/PUT /purchases/1 or /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: "Venta actualizada con exito." }
        format.json { render :show, status: :ok, location: @purchase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1 or /purchases/1.json
  def destroy
    @purchase.destroy!
    respond_to do |format|
      format.html { redirect_to purchases_path, status: :see_other, notice: "Venta eliminada correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params.expect(:id))
    end

    def set_product
      @producto = Producto.find_by(id: params[:purchase][:producto_id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.expect(purchase: [ :fecha_venta, :cantidad, :precio_unitario, :precio_total_venta, :user_id, :producto_id, :nombre_cliente ])
    end
end
