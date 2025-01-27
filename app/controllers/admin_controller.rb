class AdminController < ApplicationController
  before_action :set_user, only: [:update]
  before_action :authenticate_user!
  before_action :authorize_admin_or_gerente!, only: [:create, :update,:destroy]

  def index
    @users = User.all
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if current_user.admin_role?
      if @user.save
        redirect_to admin_index_path, notice: "Usuario creado con éxito."
      else
        render :new, status: :unprocessable_entity
      end
    elsif current_user.gerente_role?
      if @user.role.in?(["gerente", "empleado"])
        if @user.save
          redirect_to admin_index_path, notice: "Usuario creado con éxito."
        else
          render :new, status: :unprocessable_entity
        end
      else
        redirect_to admin_index_path, alert: "No tienes permiso para asignar este rol."
      end
    else
      redirect_to root_path, alert: "No tienes permiso para realizar esta acción."
    end
  end

  def update
    if current_user.admin_role?
      if @user.update(user_params)
        redirect_to admin_index_path, notice: "Rol actualizado con éxito."
      else
        redirect_to admin_index_path, alert: "Error al actualizar el rol."
      end
    elsif current_user.gerente_role?
      if params[:user][:role].in?(["gerente", "empleado"])
        if @user.update(user_params)
          redirect_to admin_index_path, notice: "Rol actualizado con éxito."
        else
          redirect_to admin_index_path, alert: "Error al actualizar el rol."
        end
      else
        redirect_to admin_index_path, alert: "No tienes permiso para asignar este rol."
      end
    else
      redirect_to root_path, alert: "No tienes permiso para realizar esta acción."
    end
  end

  def destroy
    if current_user.admin_role? || (current_user.gerente_role? && @user.role == "empleado")
      if @user.destroy
        redirect_to admin_index_path, notice: "Usuario eliminado con éxito."
      else
        redirect_to admin_index_path, alert: "Error al eliminar el usuario."
      end
    else
      redirect_to admin_index_path, alert: "No tienes permiso para eliminar este usuario."
    end
  end



  private

  def authorize_admin_or_gerente!
    unless current_user.admin_role? || current_user.gerente_role?
      redirect_to root_path, alert: "No tienes permiso para realizar esta acción."
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
