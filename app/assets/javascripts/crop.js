// Abilita il crop delle immagini per la Copertina di Impresa e per il Prodotto
$(document).ready(
  function() {
    impresa = $("#impresa_image");
    prodotto = $("#prodotto_image");

    if (impresa.length !== 0){
      document.jcrop.init({ file_input_id: 'impresa_image' });
    }
    if (prodotto.length !== 0){
      document.jcrop.init({ file_input_id: 'prodotto_image' });
    }
  });
