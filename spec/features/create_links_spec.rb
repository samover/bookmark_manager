feature "create links" do

  scenario "it adds a link, title and url to Bookmark Manager" do
    visit('/links')
    click_button('Add bookmark')
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'www.makersacademy.com')
    click_button('Submit')
    expect(page).to have_content('Makers Academy')
  end

end
