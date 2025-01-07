class AdminController < ApplicationController
  def index
    @users = Users.all
    @user = User.new
  end
end
