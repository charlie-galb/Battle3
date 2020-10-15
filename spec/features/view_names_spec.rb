feature 'Visible names' do
  scenario 'Can enter player names in a form and see them on screen' do
    sign_in_and_play
    expect(page).to have_content 'Beca'
    expect(page).to have_content 'Charlie'
  end
end
