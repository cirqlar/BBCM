class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact.subject
  #
  def contact(message)
    @message = message

    mail from: %("BBCM" <#{ENV['GMAIL_USER']}>), to: %("BBCM" <#{ENV['GMAIL_USER']}>), subject: message[:title]
  end
end
