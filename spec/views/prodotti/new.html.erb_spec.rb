require 'rails_helper'

RSpec.describe "prodotti/new", type: :view do
  before(:each) do
    assign(:prodotto, Prodotto.new(
      :nome => "MyString",
      :prezzo => 1.5,
      :qta => 1,
      :descrizione => "MyString"
    ))
  end

  it "renders new prodotto form" do
    render

    assert_select "form[action=?][method=?]", prodotti_path, "post" do

      assert_select "input#prodotto_nome[name=?]", "prodotto[nome]"

      assert_select "input#prodotto_prezzo[name=?]", "prodotto[prezzo]"

      assert_select "input#prodotto_qta[name=?]", "prodotto[qta]"

      assert_select "input#prodotto_descrizione[name=?]", "prodotto[descrizione]"
    end
  end
end
