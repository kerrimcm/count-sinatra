feature 'the app updates and displays the time when the count is changed' do
  scenario 'the user updates the count' do
    visit("/")
    click_button "Increment"
    expect(page).to have_content "The count was last updated at #{Time.now.strftime("%I:%M %p")}"
  end
end 