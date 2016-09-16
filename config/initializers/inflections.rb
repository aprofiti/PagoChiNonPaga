# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

ActiveSupport::Inflector.inflections do |inflect|
  # Utente, Cliente
  inflect.plural /([\w]*)nte$/i, '\1nti'
  inflect.singular /([\w]*)nti$/i, '\1nte'

  # Titolare
  inflect.plural /([\w]*)are$/i, '\1ari'
  inflect.singular /([\w]*)ari$/i, '\1are'

  # Categoria, Sottocategoria
  inflect.plural /([\w]*)gorie$/i, '\1goria'
  inflect.singular /([\w]*)goria$/i, '\1gorie'

  # azione, condizione, deviazione, proiezione
  inflect.plural /([\w]*)zione$/i, '\1zioni'
  inflect.singular /([\w]*)zioni$/i, '\1zione'

  # Irregolarità
  inflect.irregular 'ordine', 'ordini'
  inflect.irregular 'negozio', 'negozzi'
  inflect.irregular 'impresa', 'imprese'
  inflect.irregular 'prodotto', 'prodotti'
  inflect.irregular 'indirizzo', 'indirizzi'

  # Uncountable
  inflect.uncountable %w( citta )

end
