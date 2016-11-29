rails generate scaffold Utente nome:string cognome:string cf:string data_nascita:date telefono:string

rails generate scaffold Cliente

rails generate scaffold Titolare piva:string

rails generate scaffold Admin username:string

rails generate scaffold Impresa nome:string telefono:string fax:string giorni_orari:string email:string sitoweb:string facebook:string descrizione:string lat:float lng:float verificato:boolean congelato:boolean

rails generate scaffold Prodotto nome:string prezzo:float qta:integer descrizione:string

rails generate scaffold Ordine data:datetime stato:string

rails generate scaffold Citta nome:string provincia:string regione:string

rails generate scaffold Indirizzo via:string ncivico:integer cap:string quartiere:string

rails generate scaffold Sottocategoria nome:string

rails generate scaffold Categoria nome:string

rake db:migrate
