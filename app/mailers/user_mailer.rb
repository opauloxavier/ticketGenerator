class UserMailer < ApplicationMailer
  default from: "contato@cfccasal20.com.br"

  def welcome_email(user)
    @user = user
    @url  = 'http://cfccasal20.com.br/'
    mail(to: @user.email, subject: 'Você ganhou um Cupom de Desconto!')
  end

end
