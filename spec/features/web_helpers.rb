def sign_in_and_play
  visit("/")
  fill_in('player1_name', with: 'Beca')
  fill_in('player2_name', with: 'Charlie')
  click_button('Submit')
end
