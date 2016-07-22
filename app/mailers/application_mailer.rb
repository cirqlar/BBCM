class ApplicationMailer < ActionMailer::Base
  default from: %("BBCM" <#{ENV['GMAIL_USER']}>)
  layout 'mailer'
end
