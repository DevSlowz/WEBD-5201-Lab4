class RegistrationsController < ApplicationController
  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Send the welcome email after successful registration
      UserMailer.welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Registration successful'
    else
      render :sign_up
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
