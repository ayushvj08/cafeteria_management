class UserMailerPreview < ActionMailer::Preview
  def reset_password_email
    UserMailer.reset_password_email
  end
end
