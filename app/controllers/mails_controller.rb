class MailsController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def send_mail
    message = params[:body]
    user = current_user
    SupportMailer.digest(user, message).deliver_now
    redirect_to root_path
  end
end
