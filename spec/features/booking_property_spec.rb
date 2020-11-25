feature 'user can book a property' do
  scenario 'user can book a property' do
    Property.create(name: "house", description: "small, 3 rooms", cost: 50)
    visit('/property')
    click_button('Request Booking')
    click_button('Confirm Booking')
    expect(current_path).to eq '/property/confirmed'
    expect(page).to have_content 'Your booking is confirmed!'
  end

  scenario 'user can see the proeprty they want to book' do
    property = Property.create(name: "house", description: "small, 3 rooms", cost: 50)
    visit('/property')
    click_button('Request Booking')
    expect(current_path).to eq "/property/#{property.id}/book"
    expect(page).to have_content("house")
  end


end
