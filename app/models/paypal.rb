class Paypal < ActiveRecord::Base
  require 'paypal-sdk-rest'
  include PayPal::SDK::REST
  include PayPal::SDK::Core::Logging

  def self.crea_pagamento(return_path,cancel_path,ordine)
    @pagamento= Payment.new({
      :intent =>  "sale",
      :payer =>  {
        :payment_method =>  "paypal" },

      :redirect_urls => {
        :return_url => return_path,#{}"#{root_url}mieiOrdini/#{@ordine.id}/checkout",
        :cancel_url => cancel_path },

      :transactions =>  [{
        :payee => {
          :email => ordine.impresa.titolare.email_paypal
        },
        :item_list => {
          #Items vuota, viene riempita in ciclo sottostante
          :items => []},
        :amount =>  {
          :total =>  ordine.getTotale,
          :currency =>  "EUR" ,
          :details => {
            :shipping => ordine.spedizione,
            :subtotal => ordine.totale
          }
        },
        :description =>  "Transazione ordine #{ordine.id}, impresa #{ordine.impresa.getNome}" }]})

      unique_ids= ordine.prodotti.uniq
      unique_ids.each do |prodotto|
        @pagamento.transactions.at(0).item_list.items.merge!({
          :name => prodotto.nome,
          :price => prodotto.prezzo,
          :currency => "EUR",
          :quantity => ordine.occorrenzeProdotto(prodotto.id),
          })
      end
    return @pagamento
  end

  def self.esegui_pagamento(payer_id,id)
    @pagamento= Payment.find(id)
    @pagamento.execute(payer_id: payer_id)
  end
end
