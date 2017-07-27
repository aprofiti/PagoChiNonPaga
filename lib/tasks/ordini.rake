namespace :ordini do
  desc "Elimina ordini non aggiornati da 7 giorni solo se IN ATTESA o RICHIESTA CONFERMA"
  task :delete_7_days_old => :environment do
    #TODO: mandare una mail o una notifica a Cliente e Titolare di ordine cancellato
    Ordine.where(['updated_at < ? AND (stato_ordine_id = 1 OR stato_ordine_id = 2)', 7.days.ago]).destroy_all
    #TODO: serve un LOG
  end

end
