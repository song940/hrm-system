class Mailer < ActionMailer::Base
  default from: "admin@lsong.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.bye.subject
  #
  #
  def welcome(mail)
    @message = "Thank you for registration"
    mail(:to => mail, :subject => "Thank you for registration")
  end

  def bye(mail)
    mail(:to => mail, :subject => "You account has removed.")
  end
end
