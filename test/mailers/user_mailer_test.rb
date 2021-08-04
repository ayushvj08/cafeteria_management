require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "reset_password_email" do
    mail = UserMailer.reset_password_email
    assert_equal "reset_password_email", mail.subject
    assert_equal [email_address_with_name(@user.email, @user.name)], mail.to
    assert_equal [email_address_with_name("support@hot-cafe.com", "Hot Cafe")], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
