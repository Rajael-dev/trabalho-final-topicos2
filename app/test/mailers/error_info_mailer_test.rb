require "test_helper"

class ErrorInfoMailerTest < ActionMailer::TestCase
  test "catch_error" do
    mail = ErrorInfoMailer.catch_error
    assert_equal "Catch error", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end