class ApplicationMailer < ActionMailer::Base
  default from: %("BBCM" <announcements@bbcm.com>)
  layout 'mailer'
end
