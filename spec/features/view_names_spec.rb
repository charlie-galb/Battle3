feature 'Visible names' do
  scenario 'Can enter player names in a form and see them on screen' do
    visit("/")
    fill_in('Player1_Name', with: 'Beca')
    fill_in('Player2_Name', with: 'Charlie')
    click_button('Submit')
    expect(page).to have_content 'Beca'
    expect(page).to have_content 'Charlie'
  end
end
