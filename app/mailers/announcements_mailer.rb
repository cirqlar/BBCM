class AnnouncementsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.announcements_mailer.announce.subject
  #
  def announce(suber, an)
    @suber = suber
    @an = an
    mail to: suber.email, subject: an.title
  end
end
