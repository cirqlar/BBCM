require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "send_reset" do
    mail = AdminMailer.send_reset
    assert_equal "Send reset", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
