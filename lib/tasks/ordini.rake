namespace :ordini do
  desc "Elimina ordini non aggiornati da 7 giorni solo se IN ATTESA o RICHIESTA CONFERMA"
  task :delete_7_days_old => :environment do
    # forse c'e un modo meno pesante per fare sto ciclo, TODO: controllare quanto costa Ordine.where
    ordini= Ordine.where(['updated_at < ? AND (stato_ordine_id = 1 OR stato_ordine_id = 2)', 7.days.ago])
    ordini.each do |ordine|
      #TODO: scommentare per mandare mail a cliente e titolare di avvenuto annullamento ordine
      #@cliente= ordine.cliente
      #@titolare= ordine.impresa.titolare
      #CustomMailer.ordine_annullato(@titolare,@cliente,ordine).deliver_now
      ordine.destroy
    end

  end

end
