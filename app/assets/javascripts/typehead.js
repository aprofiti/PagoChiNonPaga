// Inizializza typehead
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
        empty: [
                '<div class="empty-message">',
                'Nessuna impresa corrispondente',
                '</div>'
            ].join('\n'),
        suggestion: Handlebars.compile("<div> {{#if nome}} <strong>Impresa:</strong> {{nome}} {{/if}} {{#if citta}} <strong>Citta:</strong> {{citta}} {{/if}}  </div>")
      }
    }).on('typeahead:selected ', function (e, datum) {
        document.getElementById('id_imp').value = datum.id;
    });
  };
  return initialize_imprese_typeahead();
});
