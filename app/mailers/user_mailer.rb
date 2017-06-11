class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @activation_url = activate_url(token: user.activation_token)
    mail to: user.email
  end

  def reset_password_email(user)
    @user = user
    @reset_password_url = reset_password_url(token: user.reset_password_token)
    mail to: user.email
  end

end
