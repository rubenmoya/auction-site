class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to root_path, flash: { success: 'Login successful'}
    else
      flash.now[:danger] = 'Login failed'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path, flash: { success: 'Login successful'}
  end
end
