class UserMailer < ActionMailer::Base
  default from: "CloudService <chris.bossie@gmail.com>"
  
  def welcome_email(user)
    @user = user
    @verify_url  = "http://localhost:3000/verify_user?email=#{@user.email}&verification_code=#{@user.verification_code}"
    mail(to: "#{@user.name} <#{@user.email}>", subject: 'Welcome to CloudService')
  end
end
