class FoodOrderMailer < ApplicationMailer
  helper :application
  default from: 'notifications@example.org'
#  layout 'mailer'

  def order_email(user, phone, email, cart)
    @user = user
    @phone = phone
    @email = email
    @cart = cart
    mail(to: @user.email,
      subject: 'You have new order')
  end
end
