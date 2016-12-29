$(function() {
  var initialize_imprese_typeahead;
  initialize_imprese_typeahead = function() {
    var imprese_typeahead;
    imprese_typeahead = new Bloodhound({
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace("nome", "id"),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: "/imprese/autocomplete"
    });

    imprese_typeahead.initialize();

    $(".form-control").typeahead(null, {
      displayKey: "nome",
      source: imprese_typeahead.ttAdapter(),
      // Modifica l'aspetto del finestra dei risultati
      templates: {
        suggestion: Handlebars.compile("<div> {{#if nome}} <strong>Impresa:</strong> {{nome}} {{/if}} {{#if nomeCategoria}} Categoria: <strong>{{nomeCategoria}}</strong> {{/if}} {{#if nomeSottocategoria}} Sottocategoria: <strong>{{nomeSottocategoria}}</strong> {{/if}} </div>")
      }
    }).on('typeahead:selected ', function (e, datum) {
        //console.log(JSON.stringify(datum));
        document.getElementById('id_imp').value = datum.id;
        //console.log(document.getElementById('id_imp').value);

    });
  };
  return initialize_imprese_typeahead();
});
