class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact(message)
    @message = message

    mail to: %("BBCM" <thebbcm@gmail.com>), subject: message[:title]
  end
end
