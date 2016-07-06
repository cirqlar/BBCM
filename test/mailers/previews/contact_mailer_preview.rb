# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/contact
  def contact
    message = {
      sender: "Ryan Booth",
      email: "email@email.com",
      title: "Some shit",
      content: "dfjenjnwejdjenwj jnfjenfje qjdnjqndqwnd dwjdnqjndjq wdqjdnqjdnq dqndq djnq"
    }
    ContactMailer.contact(message)
  end

end
