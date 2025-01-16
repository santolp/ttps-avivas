class AdminController < ApplicationController
  before_action :set_user, only: [:update]
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users = User.all
    @user = User.new  
  end




  def create 
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_index_path, notice: 'Usuario Creado'
    else
      redirect_to admin_index_path,alert: 'No es posible crear usuario'
    end
  end


  def update     
    if @user.update(user_params)
      redirect_to admin_index_path, alert: 'Usuario Actualizado'
    else
      redirect_to admin_index_path,alert: 'No es posible actualizar'
    end
  end


  private 

  def authorize_admin!
    redirect_to root_path, alert: 'Acceso Denegado' unless current_user.admin_role? or current_user.gerente_role?
  end


  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:role)
  end

  def set_user
    @user=User.find(params[:id])
  end

end
