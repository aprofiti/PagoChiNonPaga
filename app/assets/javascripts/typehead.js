// Inizializza typehead
var selected= false;                              //indica se c'è stata una selezione e un autocomplete con il tab

$(function() {
  var initialize_imprese_typeahead;
  initialize_imprese_typeahead = function() {
    var imprese_typeahead;
    imprese_typeahead = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("nome", "id","citta"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch:{
        ttl: 1,
        url: "/imprese/autocomplete"
      }

    });

    imprese_typeahead.initialize();

    $(".typeahead").typeahead(null, {
      displayKey: "nome",
      source: imprese_typeahead.ttAdapter(),
      // Modifica l'aspetto del finestra dei risultati
      templates: {
        //empty indica il messaggio che viene mostrato se scrivo qualcosa che non è in source
        empty: [
                '<div class="empty-message">','Nessuna impresa corrispondente','</div>'
            ].join('\n'),
        suggestion: Handlebars.compile("<div> {{#if nome}} <strong>Impresa:</strong> {{nome}} {{/if}} {{#if citta}} <strong>Citta:</strong> {{citta}} {{/if}}  </div>")
      }
    }).on('typeahead:selected ', function (e, datum) {        //evento elemento selezionato dal dropdown
        selected= true;
        document.getElementById('id_imp').value = datum.id;
    }).on('typeahead:autocompleted ', function (e, datum) {  //evento elemento autocompletato da suggerimento
        selected= true;
        document.getElementById('id_imp').value = datum.id;
      }).on('keypress', function(e) {                        //lanciato se premuto un tasto, keycode 13 sta per Enter
            if(e.keyCode == 13) {
                if(selected) return true;
                else  e.preventDefault();
                $('#typeahead').typeahead('close');
            }
        });
  };
  return initialize_imprese_typeahead();
});

//controllo input typeahead al click pulsante cerca
$(document).ready(function(){
 $('#typesearch').click(function (e) {
   if(selected) return true;
   else  e.preventDefault();
  });
 });
