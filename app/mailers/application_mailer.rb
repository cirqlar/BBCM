class ApplicationMailer < ActionMailer::Base
  default from: %("BBCM" <thebbcm@gmail.com>)
  layout 'mailer'
end
