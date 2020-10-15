feature 'view score' do
  scenario 'Can view the opponent score' do
    visit("/")
    fill_in('Player1_Name', with: 'Beca')
    fill_in('Player2_Name', with: 'Charlie')
    click_button('Submit')
    expect(page).to have_content('20/60 HP').twice
  end
end
