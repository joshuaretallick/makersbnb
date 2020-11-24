feature 'user can add a property listing' do
  scenario 'user can click add property button' do
    visit('/property')
    expect(page).to have_button 'Add property'
    click_button('Add property')
    expect(current_path).to eq '/property/new'
  end

  scenario 'user can add a property' do
    visit('property/new')
    fill_in('name', with: 'house')
    fill_in('description', with: 'small, 3 rooms')
    fill_in('cost', with: 50)
    click_button 'Add'

    expect(page).to have_content 'house'
    expect(page).to have_content 'small, 3 rooms'
    expect(page).to have_content '£50'
  end
end
