# spec/features/visitor_signs_up_spec.rb
require 'rails_helper'

feature 'Home' do

  scenario 'Click on Categorie' do
    visit root_path
    click_link('Categorie')

    expect(current_path).to eq categorie_path
  end

  scenario 'Click on Accedi' do
    visit root_path
    click_link('Accedi')

    expect(current_path).to eq new_utente_session_path
  end

  scenario 'Click on Registrati' do
    visit root_path
    click_link('Registra')

    expect(current_path).to eq registrati_path
  end

end
