class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :is_current_user_showing?, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  def is_current_user_showing?
    unless current_user.id.to_s == params[:id].to_s
      flash[:danger] = "You can't display a profile that is not yours !"
      redirect_to root_path
    end
  end
end