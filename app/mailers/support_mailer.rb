class SupportMailer < ApplicationMailer
  def digest(user, message)
    @message = message
    @user = user

    mail to: "ad44inych@yandex.ru"
  end
end
