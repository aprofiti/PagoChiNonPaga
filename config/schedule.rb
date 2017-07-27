
# scommentare la riga sotto per attivare il clean automatico anche in development
# set :environment, "development"

every 1.days, :at => '12:00 am' do
  rake "ordini:delete_7_days_old"
end
