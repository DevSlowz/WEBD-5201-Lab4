class PasswordResetsController < ApplicationController
  def new
    # Action to display the form for password reset
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      # send email
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: 'If the email is valid, you will receive a password reset email.'
  end

  def edit
    @user = User.find_signed(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'The password reset link is invalid or has expired.'
  end

  def update
    @user = User.find_signed(params[:token], purpose: 'password_reset')
    if @user.updator(password_params)
      redirect_to sign_in_path, notice: 'Password reset successfully.'
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
