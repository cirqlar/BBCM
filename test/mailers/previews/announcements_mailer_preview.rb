# Preview all emails at http://localhost:3000/rails/mailers/announcements_mailer
class AnnouncementsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/announcements_mailer/announce
  def announce
    suber = Subscriber.first
    an = Announcement.first
    AnnouncementsMailer.announce(suber, an)
  end

end
