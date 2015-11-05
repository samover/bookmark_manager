feature 'Add a new tag' do
  before(:each) do
    visit '/links'
    click_button('Add bookmark')
    fill_in('title', with: 'Whatever')
    fill_in('url', with: 'www.whatever.cn')
  end

  scenario 'add a tag to a new link' do
    fill_in('tag', with: 'made_in')
    click_button('Submit')
    within('ul#links') do
      expect(page).to have_content('made_in')
    end
  end

  scenario 'adding multiple tags' do
    fill_in('tag', with: 'made_in, china')
    click_button('Submit')
    link = Link.all(title: 'Whatever')
    expect(link.tags.first.name).to eq 'made_in'
    expect(link.tags.last.name).to eq 'china'
  end
end
