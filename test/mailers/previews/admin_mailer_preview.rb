# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/send_reset
  def send_reset
    admin = Admin.first
    admin.reset_digest = Admin.new_token
    AdminMailer.send_reset(admin)
  end

end
