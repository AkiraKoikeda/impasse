class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
    else render "edit"
    end
  end

  def unscribe
  end

  def withdrawal
    current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
