class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show edit update destroy ]

  # GET /purchases or /purchases.json
  def index
    @purchases = Purchase.all
    @users = User.all
    @productos = Producto.all
    
  end

  # GET /purchases/1 or /purchases/1.json
  def show    
    
  end

  # GET /purchases/new
  def new
    @productos = Producto.all
    @purchase = Purchase.new
  end

  def edit
    @productos = Producto.all 
  end




  # POST /purchases or /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase, notice: "Venta Creada correctamente." }
        format.json { render :show, status: :created, location: @purchase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
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

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.expect(purchase: [ :fecha_venta, :cantidad, :precio_unitario, :precio_total_venta, :user_id, :producto_id, :nombre_cliente ])
    end
end
