feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'mario@mario.com', password: 'mario')
    visit '/sessions/new'
    fill_in(:email, with: 'mario@mario.com')
    fill_in(:password, with: 'mario')
    click_button('Sign in')
    expect(current_path).to eq '/property'
  end

  it 'a user can sign out' do
    User.create(email: 'mario@mario.com', password: 'mario')
    visit '/sessions/new'
    fill_in(:email, with: 'mario@mario.com')
    fill_in(:password, with: 'mario')
    click_button('Sign in')
    click_button('Sign out')
    expect(current_path).to eq '/'
    expect(page).to have_content 'You have successfully signed out'
  end

  it 'a user sees an error if they get their email wrong' do
    User.create(email: 'mario@mario.com', password: 'mario')
    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, mario@mario.com'
    expect(page).to have_content 'Please check your email or password.'
  end

  it 'a user sees an error if they get their password wrong' do
    User.create(email: 'mario@mario.com', password: 'mario')
    visit '/sessions/new'
    fill_in(:email, with: 'mario@mario.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    expect(page).not_to have_content 'Welcome, mario@mario.com'
    expect(page).to have_content 'Please check your email or password.'
  end

end
