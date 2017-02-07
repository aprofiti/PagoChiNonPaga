class CustomMailer < ApplicationMailer
  def pagamento_riuscito_cliente(user)
    @user = user
    mail(to: @user.email, subject: 'Pagamento Riuscito Cliente')
  end

  def pagamento_riuscito_titolare(user)
    @user = user
    mail(to: @user.email, subject: 'Pagamento Riuscito Titolare')
  end

end
