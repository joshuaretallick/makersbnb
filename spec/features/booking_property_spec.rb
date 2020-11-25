feature 'user can book a property' do
  scenario 'user can book a property' do
    Property.create(name: "house", description: "small, 3 rooms", cost: 50)
    User.create(email: 'mario@mario.com', password: 'mario')
    visit '/sessions/new'
    fill_in(:email, with: 'mario@mario.com')
    fill_in(:password, with: 'mario')
    click_button('Sign in')
    click_button('Request Booking')
    click_button('Confirm Booking')
    expect(current_path).to eq '/property/confirmed'
    expect(page).to have_content 'Your booking is confirmed!'
  end

  scenario 'user can see the proeprty they want to book' do

    property = Property.create(name: "house", description: "small, 3 rooms", cost: 50)
    sign_in
    click_button('Request Booking')
    expect(current_path).to eq "/property/#{property.id}/book"
    expect(page).to have_content("house")
  end


end
