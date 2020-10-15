feature 'Attack' do
  scenario 'Player 1 can attack player 2 and get a confirmation' do
    sign_in_and_play
    click_on('Attack')
    #expect(page).to have_content 'Beca attacked Charlie!!!'
    expect(page).to have_content 'Charlie 50/60 HP'
  end
end
