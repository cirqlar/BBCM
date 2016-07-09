class AdminMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.send_reset.subject
  #
  def send_reset(admin)
    @admin = admin
    mail to: %("#{admin.name}" <#{admin.email}>), subject: "Password reset"
  end
end
