feature 'a reset button which sets the count back to 0' do
  scenario 'the user resets the count' do
    visit("/")
    click_button "Increment"
    click_button "Increment"
    click_button "Reset"
    expect(page).to have_content 0
  end 
end 