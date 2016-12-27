# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  initialize_imprese_typeahead = ->
    imprese_typeahead = new Bloodhound(
      datumTokenizer: Bloodhound.tokenizers.obj.whitespace(
        "nome", "sottocategoria"
      ),
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: "/imprese/autocomplete"
    )

    imprese_typeahead.initialize()

    $(".form-control").typeahead null,
      displayKey: "nome"
      source: imprese_typeahead.ttAdapter()


  initialize_imprese_typeahead()
