feature 'view score' do
  scenario 'Can view the opponent score' do
    sign_in_and_play
    expect(page).to have_content('60/60 HP').twice
  end
end
