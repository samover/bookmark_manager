feature 'Add a new tag' do
  scenario 'add a tag to a new link' do 
    visit '/links'
    click_button('Add bookmark')
    fill_in('title', with: 'Whatever')
    fill_in('url', with: 'www.whatever.cn')
    fill_in('tag', with: 'made_in')
    click_button('Submit')
    within('ul#links') do
      expect(page).to have_content('made_in')
    end
  end
end
