class CustomMailer < ApplicationMailer
  def pagamento_riuscito_cliente(cliente,ordine)
    @cliente = cliente
    mail(to: @cliente.email, subject: 'Pagamento Riuscito Cliente')
  end

  def pagamento_riuscito_titolare(titolare,ordine)
    @titolare = titolare
    mail(to: @titolare.email, subject: 'Pagamento Riuscito Titolare')
  end

  def titolare_creato(titolare)
    @titolare = titolare
    email= @titolare.citta.polo.email
    mail(to: email, subject: "Titolare #{@titolare.id} si è iscritto")
  end

  def impresa_creata(titolare,impresa)
    @titolare = titolare
    @impresa = impresa
    email= @titolare.citta.polo.email
    mail(to: email, subject: "Impresa #{@impresa.id} è stata creata")
  end

  def ordine_creato(titolare,ordine)
    @titolare = titolare
    @ordine= ordine
    mail(to: @titolare.email, subject: "Nuovo ordine per #{@ordine.impresa.nome}")
  end

  def ordine_annullato(titolare,ordine)
    @titolare = titolare
    @ordine= ordine
    mail(to: @cliente.email, subject: "Ordine per #{@ordine.impresa.nome} annullato")
  end

  def modifica_stato_ordine(cliente,ordine)
    @cliente = cliente
    @ordine = ordine
    mail(to: @cliente.email, subject: "Modifica ordine #{@ordine.id}")
  end
end
