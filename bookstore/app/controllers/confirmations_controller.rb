class ConfirmationsController < ApplicationController
  def index; end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])

    if user
      user.email_activate
      if user.confirm_token_at
        flash[:success] = "Welcome to the Phuong's App! Your email has been confirmed.
        Please sign in to continue."
        redirect_to login_url
      else
        user.send_activation_email
        # update(confirm_token_send)
        redirect_to confirmations_path
      end
    else
      flash[:error] = 'Sorry. User does not exist'
      redirect_to :users
    end
  end
end
