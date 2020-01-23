class UserMailer < ApplicationMailer
  default from: "info@dairycow.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_confirmation.subject
  #
  def user_confirmation
    #@greeting = "Hi"
    @user = user
    mail to: user.email, subject: 'New Dairy Cow Account Confirmation'
  end
end
