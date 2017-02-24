# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Polo.create(nome: 'AP Messina',email: 'emailmessina@polo.it')
Polo.create(nome: 'AP Palermo',email: 'emailpalermo@polo.it')
Polo.create(nome: 'AP Catania',email: 'emailcatania@polo.it')

Citta.create(nome: 'Messina', provincia: 'ME', regione: 'Sicilia', polo_id: 1)
Citta.create(nome: 'Palermo', provincia: 'PA', regione: 'Sicilia', polo_id: 2)
Citta.create(nome: 'Catania', provincia: 'CT', regione: 'Sicilia', polo_id: 3)
Citta.create(nome: 'Taormina', provincia: 'ME', regione: 'Sicilia', polo_id: 1)
Citta.create(nome: "Ali'", provincia: 'ME', regione: 'Sicilia', polo_id: 1)
Citta.create(nome: 'Bagheria', provincia: 'PA', regione: 'Sicilia', polo_id: 2)
Citta.create(nome: 'Corleone', provincia: 'PA', regione: 'Sicilia', polo_id: 2)
Citta.create(nome: "Cefalu'", provincia: 'PA', regione: 'Sicilia', polo_id: 2)
Citta.create(nome: 'Belpasso', provincia: 'CT', regione: 'Sicilia', polo_id: 3)
Citta.create(nome: 'Bronte', provincia: 'CT', regione: 'Sicilia', polo_id: 3)
Citta.create(nome: 'Giarre', provincia: 'CT', regione: 'Sicilia', polo_id: 3)


Categoria.create(nome: 'Alimentari')
Categoria.create(nome: 'Divertimento')
Categoria.create(nome: 'Agraria')
Categoria.create(nome: 'Vacanze')
Categoria.create(nome: 'Bricolage')
Categoria.create(nome: 'Cucina')
Categoria.create(nome: 'Turismo')
Categoria.create(nome: 'Sanitari')
Categoria.create(nome: 'Intrattenimento')
Categoria.create(nome: 'Elettronica')
Categoria.create(nome: 'Tecnologia')
Categoria.create(nome: 'Vestiario')
Categoria.create(nome: 'Ecologia')
Categoria.create(nome: 'Cose')
Categoria.create(nome: 'Complotti')

Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)
Sottocategoria.create(nome: 'Palestre', categoria_id: 1)
Sottocategoria.create(nome: 'Agenzie di Viaggio', categoria_id: 2)
Sottocategoria.create(nome: 'Accademie della crusca', categoria_id: 3)
Sottocategoria.create(nome: 'Pollifici', categoria_id: 4)
Sottocategoria.create(nome: 'Carceri', categoria_id: 5)
Sottocategoria.create(nome: 'Fazzoletterie', categoria_id: 6)
Sottocategoria.create(nome: 'Fiorai', categoria_id: 7)
Sottocategoria.create(nome: 'Farmacie', categoria_id: 8)
Sottocategoria.create(nome: 'Terre piatte', categoria_id: 9)
Sottocategoria.create(nome: 'Pelletterie', categoria_id: 9)
Sottocategoria.create(nome: 'Tavolerie', categoria_id: 9)
Sottocategoria.create(nome: 'Abbacchierie', categoria_id: 10)
Sottocategoria.create(nome: 'Zoccolerie', categoria_id: 10)
Sottocategoria.create(nome: 'Banche', categoria_id: 11)
Sottocategoria.create(nome: 'Mandarinerie', categoria_id: 12)
Sottocategoria.create(nome: 'Calzolaierie', categoria_id: 13)
Sottocategoria.create(nome: 'Forchetterie', categoria_id: 13)
Sottocategoria.create(nome: 'Cineserie', categoria_id: 13)
Sottocategoria.create(nome: 'Truffaldinerie', categoria_id: 13)
Sottocategoria.create(nome: 'Ruberie', categoria_id: 14)
Sottocategoria.create(nome: 'Coserie', categoria_id: 15)
Sottocategoria.create(nome: 'Caseifici', categoria_id: 15)

Admin.create(email: 'gab@riele.com', password: '123456', password_confirmation: '123456', polo_id: 1)
Admin.create(email: 'lor@enzo.com', password: '1q2w3e', password_confirmation: '1q2w3e', polo_id: 2)
Admin.create(email: 'alex@email.it', password: 'password', password_confirmation: 'password', polo_id: 3)
Admin.create(email: 'super@email.it', password: 'password', password_confirmation: 'password', polo_id: 1, superadmin: true)

Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Gigi', cognome: 'Meraviglia', cf: 'ajsjsan', telefono: '12345', data_nascita: Date.parse('08/08/1964'), email: 'cli1@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Via Italia', citta_id: 1, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Rino', cognome: 'Rino', cf: 'dsahju', telefono: '1354', data_nascita: Date.parse('04/11/1991'), email: 'cli2@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Via del Corso', citta_id: 1, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Franco', cognome: 'Massimo', cf: 'jasdnjd', telefono: '15325', data_nascita: Date.parse('01/01/1992'), email: 'cli3@ente.it',
password: '123456', password_confirmation: '123456', indirizzo: 'Piazza della liberazione', citta_id: 1, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Tommaso', cognome: 'Meraviglia', cf: 'skanjd', telefono: '1242', data_nascita: Date.parse('03/05/1907'), email: 'cli4@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Via Catania', citta_id: 2, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Massimo', cognome: 'Franco', cf: 'sdakcc', telefono: '15252', data_nascita: Date.parse('01/05/1930'), email: 'cli5@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Via Palermo', citta_id: 2, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Ambrogio', cognome: 'De Scrotiis', cf: 'nsjns', telefono: '98989', data_nascita: Date.parse('11/11/1952'), email: 'cli6@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Via Roma', citta_id: 3, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Fra', cognome: 'Nebbia', cf: 'wdjiwj9', telefono: '5737378', data_nascita: Date.parse('01/08/2000'), email: 'cli7@ente.it',
password: '123456', password_confirmation: '123456', indirizzo: 'Via della Libertà', citta_id: 3, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Riccardo', cognome: 'Ilgrande', cf: 'w9udw9jf', telefono: '3838', data_nascita: Date.parse('02/09/1996'), email: 'cli8@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Via Cavour', citta_id: 3, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Linus', cognome: 'Torvalds', cf: 'wd9wjw', telefono: '463746', data_nascita: Date.parse('08/02/1991'), email: 'cli9@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Via da qui', citta_id: 4, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Al', cognome: 'Alino', cf: 'f3jfi2', telefono: '249209', data_nascita: Date.parse('01/05/1997'), email: 'cli10@ente.it',
password: '123456', password_confirmation: '123456', indirizzo: 'Via assurda', citta_id: 5, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'John', cognome: 'Tortora', cf: '2iin2f', telefono: '22746', data_nascita: Date.parse('01/05/1969'), email: 'cli11@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'via dello scandalo', citta_id: 6, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Jack', cognome: 'Baglio', cf: 'j9wj9j29', telefono: '0292836', data_nascita: Date.parse('31/12/1999'), email: 'cli12@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Contrada massiccia', citta_id: 7, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Soreta', cognome: 'Mammeta', cf: '1uhue', telefono: '3467365', data_nascita: Date.parse('04/06/1977'), email: 'cli13@ente.it',
password: '123456', password_confirmation: '123456', indirizzo: 'Largo Sorella', citta_id: 8, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Mario', cognome: 'Rossi', cf: '2uh2uh', telefono: '38573857', data_nascita: Date.parse('01/05/1990'), email: 'cli14@ente.it',
password: '123456', password_confirmation: '123456', indirizzo: 'Rotonda di zio peppe', citta_id: 9, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Arturo', cognome: 'Di Napoli', cf: '29j02j0', telefono: '263748', data_nascita: Date.parse('02/05/1980'), email: 'cli15@ente.it',
password: '123456', password_confirmation: '123456', indirizzo: 'La strada del buon pastore', citta_id: 10, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Bello Figo', cognome: 'Gu', cf: 'uh21ueh', telefono: '746758', data_nascita: Date.parse('01/03/2004'), email: 'cli16@ente.it',
password: '123456', password_confirmation: '123456', indirizzo: 'Via agnello', citta_id: 10, confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Sancho', cognome: 'Panza', cf: 'ncknskc', telefono: '9566656', data_nascita: Date.parse('01/03/1995'), email: 'cli17@ente.it',
 password: '123456', password_confirmation: '123456', indirizzo: 'Via agnellone', citta_id: 3).save(:validate => false)
Cliente.create(citta_nascita: 1, sesso: 'M',nome: 'Miss', cognome: 'Mr', cf: 'dkowmsmc', telefono: '78446778', data_nascita: Date.parse('01/03/1991'), email: 'cli18@ente.it',
password: '123456', password_confirmation: '123456', indirizzo: 'Via vitello', citta_id: 6).save(:validate => false)

Titolare.create(citta_nascita: 1, sesso: 'M',nome: 'Tito', cognome: 'Lare', email: 'tito1@lare.it', password: '123456', password_confirmation: '123456', telefono: '3423556',
piva: "abcde", data_nascita: Date.parse('01/05/1930'), cf: 'sdgsg', indirizzo: 'via della vita', citta_id: 8,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Titolare.create(citta_nascita: 2, sesso: 'M',nome: 'Giangiovanni', cognome: 'Itto', email: 'tito2@lare.it', password: '123456', password_confirmation: '123456', telefono: '73249',
piva: "abcde", data_nascita: Date.parse('09/06/1955'), cf: 'kfmkimke', indirizzo: 'via in numeri', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Titolare.create(citta_nascita: 3, sesso: 'M',nome: 'Mimmo', cognome: 'Trippa', email: 'tito3@lare.it', password: '123456', password_confirmation: '123456', telefono: '000222',
piva: "abcde", data_nascita: Date.parse('03/05/1907'), cf: 'einjnf', indirizzo: 'via stanchezza', citta_id: 10,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Titolare.create(citta_nascita: 1, sesso: 'M',nome: 'Edoardo', cognome: 'Dei Boschi', email: 'tito4@lare.it', password: '123456', password_confirmation: '123456', telefono: '634622',
piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'ijgin', indirizzo: 'via del sospiro', citta_id: 2,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017')).save(:validate => false)
Titolare.create(citta_nascita: 4, sesso: 'M',nome: 'Sergio', cognome: 'Leone', email: 'tito5@lare.it', password: '123456', password_confirmation: '123456', telefono: '987765654',
piva: "abcde", data_nascita: Date.parse('08/08/1964'), cf: 'wefjun', indirizzo: 'via alla menta', citta_id: 3,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017')).save(:validate => false)

Impresa.create(nome: 'Bazzecole al chilo', telefono: '2423', descrizione: 'Mah', titolare_id: 1, citta_id: 1, verificato: true, congelato: false,indirizzo: 'Via Catania 31', email: 'impre1@sa.it').save(:validate => false)
Impresa.create(nome: 'La Cozza Felice', telefono: '32224', descrizione: 'Cozze belle', titolare_id: 1, citta_id: 1, verificato: true, congelato: false,indirizzo: 'Via Catania 31', email: 'impre2@sa.it').save(:validate => false)
Impresa.create(nome: 'Ristorante La Minestra Riscaldata', telefono: '31331', descrizione: 'Minestre belle', titolare_id: 1, citta_id: 1, verificato: true, congelato: false,indirizzo: 'Via Catania 32', email: 'impre3@sa.it').save(:validate => false)
Impresa.create(nome: 'Profumeria dal Lercio', telefono: '6564', descrizione: 'Profumi belli', titolare_id: 2, citta_id: 2, verificato: true, congelato: false,indirizzo: 'Via Catania 33', email: 'impre4@sa.it').save(:validate => false)
Impresa.create(nome: 'Tabacchi', telefono: '523221', descrizione: 'Tabacchi belli', titolare_id: 3,citta_id: 1, verificato: true, congelato: false,indirizzo: 'Via Catania 34', email: 'impre5@sa.it').save(:validate => false)
Impresa.create(nome: 'Cose per la casa', telefono: '878787', descrizione: 'Cose belle', titolare_id: 3, citta_id: 1, verificato: true, congelato: false,indirizzo: 'Via Catania 35', email: 'impre6@sa.it').save(:validate => false)
Impresa.create(nome: 'Panineria del tosto', telefono: '4354354', descrizione: 'Panini belli', titolare_id: 3, citta_id: 2, verificato: true, congelato: false,indirizzo: 'Via Catania 35', email: 'impre7@sa.it').save(:validate => false)
Impresa.create(nome: 'Viaggi in Messico srl', telefono: '543522', descrizione: 'Viaggi belli', titolare_id: 4, citta_id: 2, verificato: true, congelato: false,indirizzo: 'Via Catania 33', email: 'impre8@sa.it').save(:validate => false)
Impresa.create(nome: 'Calcolatrici Ipotetiche', telefono: '355221', descrizione: 'Calcoli ipotetici', titolare_id: 3, citta_id: 2, verificato: true, congelato: false,indirizzo: 'Via Catania 37', email: 'impre9@sa.it').save(:validate => false)
Impresa.create(nome: 'Bottiglie di plastica', telefono: '777555', descrizione: 'Belle bottiglie', titolare_id: 5, citta_id: 3, verificato: true, congelato: false,indirizzo: 'Via Catania 38', email: 'impre10@sa.it').save(:validate => false)
Impresa.create(nome: 'Panificio la spiga', telefono: '88554', descrizione: 'Panettieri belli', titolare_id: 2, citta_id: 3, verificato: true, congelato: false,indirizzo: 'Via Catania 39', email: 'impre11@sa.it').save(:validate => false)
Impresa.create(nome: 'Orologi e gioielli', telefono: '36636', descrizione: 'Orologi belli', titolare_id: 4, citta_id: 3, verificato: true, congelato: true,indirizzo: 'Via Catania 30', email: 'impre12@sa.it').save(:validate => false)


Prodotto.create(nome:'Minestra di cozze', prezzo: 50, qta: 10, descrizione: 'Minestra bella', impresa_id: 1, eliminato: false)
Prodotto.create(nome:'Salami in salamoia', prezzo: 10, qta: 140, descrizione: 'Salami belli', impresa_id: 2, eliminato: false)
Prodotto.create(nome:'Zucchine scadute', prezzo: 1, qta: 20, descrizione: 'Zucchine belle', impresa_id: 2, eliminato: false)
Prodotto.create(nome:'Eau de autogrill', prezzo: 200, qta: 100, descrizione: 'Profumo bello', impresa_id: 3, eliminato: false)
Prodotto.create(nome:'Acqua di Gianni', prezzo: 10000, qta: 1, descrizione: 'Acqua bella', impresa_id: 3, eliminato: false)
Prodotto.create(nome:'Sigarette furbe', prezzo: 5, qta: 50, descrizione: 'Sigarette belle', impresa_id: 4, eliminato: false)
Prodotto.create(nome:'Lavapanni', prezzo: 20, qta: 3, descrizione: 'Lavapanni belli', impresa_id: 5, eliminato: false)
Prodotto.create(nome:'Panino alla carbonara', prezzo: 30, qta: 60, descrizione: 'Carbonare belle', impresa_id: 6, eliminato: false)
Prodotto.create(nome:'Boeing 747', prezzo: 3445540, qta: 60, descrizione: 'Boeing belli', impresa_id: 7, eliminato: false)
Prodotto.create(nome:'Aeroplano senza ali', prezzo: 100000, descrizione: 'Aerei belli', qta: 60, impresa_id: 7, eliminato: false)
Prodotto.create(nome:'Orologi', prezzo: 100, descrizione: 'Orologi di plastica', qta: 50, impresa_id: 12, eliminato: false)
Prodotto.create(nome:'Barca di cemento armato', prezzo: 23450, descrizione: 'Mamma mia che Barca', qta: 5, impresa_id: 12, eliminato: false)

StatoOrdine.create(stato: 'In attesa')
StatoOrdine.create(stato: 'Richiesta conferma')
StatoOrdine.create(stato: 'Pagato')
StatoOrdine.create(stato: 'Spedito')
StatoOrdine.create(stato: 'Ricevuto')

Ordine.create(cliente_id: 1, impresa_id: 1, stato_ordine_id: 1, spedizione: 0.0, totale: 0.0).save(validate: false)
Ordine.create(cliente_id: 1, impresa_id: 2, stato_ordine_id: 1, spedizione: 0.0, totale: 0.0).save(validate: false)
Ordine.create(cliente_id: 4, impresa_id: 3, stato_ordine_id: 2, spedizione: 0.0, totale: 0.0).save(validate: false)
Ordine.create(cliente_id: 2, impresa_id: 7, stato_ordine_id: 2, spedizione: 0.0, totale: 0.0).save(validate: false)
Ordine.create(cliente_id: 5, impresa_id: 4, stato_ordine_id: 3, spedizione: 0.0, totale: 0.0).save(validate: false)
Ordine.create(cliente_id: 5, impresa_id: 5, stato_ordine_id: 3, spedizione: 0.0, totale: 0.0).save(validate: false)
Ordine.create(cliente_id: 3, impresa_id: 4, stato_ordine_id: 4, spedizione: 0.0, totale: 0.0).save(validate: false)
Ordine.create(cliente_id: 4, impresa_id: 4, stato_ordine_id: 4, spedizione: 0.0, totale: 0.0).save(validate: false)
Ordine.create(cliente_id: 5, impresa_id: 6, stato_ordine_id: 5, spedizione: 0.0, totale: 0.0).save(validate: false)
# Ordine verso impresa Congelata
Ordine.create(cliente_id: 1, impresa_id: 12, stato_ordine_id: 5, spedizione: 0.0, totale: 0.0).save(validate: false)

Prodotto.find(1).ordini << Ordine.find(1)
Prodotto.find(2).ordini << Ordine.find(2)
Prodotto.find(3).ordini << Ordine.find(2)
Prodotto.find(4).ordini << Ordine.find(3)
Prodotto.find(9).ordini << Ordine.find(4)
Prodotto.find(6).ordini << Ordine.find(5)
Prodotto.find(6).ordini << Ordine.find(5)
Prodotto.find(7).ordini << Ordine.find(6)
Prodotto.find(6).ordini << Ordine.find(7)
Prodotto.find(6).ordini << Ordine.find(7)
Prodotto.find(6).ordini << Ordine.find(8)
Prodotto.find(8).ordini << Ordine.find(9)
Prodotto.find(11).ordini << Ordine.find(10)

Ordine.all.each do |ordine|
  ordine.setTotale
end

Impresa.find(1).sottocategorie << Sottocategoria.find(1)
Impresa.find(1).sottocategorie << Sottocategoria.find(5)
Impresa.find(1).sottocategorie << Sottocategoria.find(2)
Impresa.find(2).sottocategorie << Sottocategoria.find(6)
Impresa.find(3).sottocategorie << Sottocategoria.find(4)
Impresa.find(3).sottocategorie << Sottocategoria.find(9)
Impresa.find(4).sottocategorie << Sottocategoria.find(10)
Impresa.find(5).sottocategorie << Sottocategoria.find(2)
Impresa.find(5).sottocategorie << Sottocategoria.find(3)
Impresa.find(5).sottocategorie << Sottocategoria.find(7)
Impresa.find(6).sottocategorie << Sottocategoria.find(3)
Impresa.find(6).sottocategorie << Sottocategoria.find(2)
Impresa.find(7).sottocategorie << Sottocategoria.find(1)
Impresa.find(7).sottocategorie << Sottocategoria.find(8)
Impresa.find(8).sottocategorie << Sottocategoria.find(4)
Impresa.find(8).sottocategorie << Sottocategoria.find(21)
Impresa.find(9).sottocategorie << Sottocategoria.find(11)
Impresa.find(9).sottocategorie << Sottocategoria.find(13)
Impresa.find(10).sottocategorie << Sottocategoria.find(14)
Impresa.find(10).sottocategorie << Sottocategoria.find(15)
Impresa.find(11).sottocategorie << Sottocategoria.find(10)
Impresa.find(11).sottocategorie << Sottocategoria.find(19)
Impresa.find(11).sottocategorie << Sottocategoria.find(23)
Impresa.find(12).sottocategorie << Sottocategoria.find(19)
