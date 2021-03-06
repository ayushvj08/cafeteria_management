class UserMailer < ApplicationMailer
  default from: email_address_with_name("support@hot-cafe.com", "Hot Cafe")

  def reset_password_email
    @user = User.find_by(email: params[:email])
    @encrypt = BCrypt::Password.create(@user.email)
    # @url = "https://google.com"

    mail(to: email_address_with_name(@user.email, @user.name),
         from: email_address_with_name("support@hot-cafe.com", "Hot Cafe"),
         reply_to: "ayush.vijayant@gmail.com",
         subject: "Password Reset link for Hot cafe")
  end
end
