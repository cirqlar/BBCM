require 'test_helper'

class AnnouncementsMailerTest < ActionMailer::TestCase
  test "announce" do
    mail = AnnouncementsMailer.announce
    assert_equal "Announce", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
