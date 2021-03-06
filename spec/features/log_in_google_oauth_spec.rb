RSpec.describe 'Log In with Google OAuth', type: :feature do
  def google_authenticate
    # Turn on 'test mode' for Omniauth
    OmniAuth.config.test_mode = true
    # Mock google authentification hash for integration testing
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(
      provider: 'google_oauth2',
      uid: '123456789',
      password: 'testpassword',
      info: {
        username: 'Test User',
        email: 'test@email.com',
      }
    )
  end

  scenario 'Can sign in with google' do
    google_authenticate
    sign_in_with_google_oauth
    expect(page).to have_content('Artventory V0.0.0.0.0.2a')
  end

  scenario 'Sign in with google failure' do
    # Turn on 'test mode' for Omniauth
    OmniAuth.config.test_mode = true
    # Mock google authentification hash with invalid credentials
    OmniAuth.config.mock_auth[:google_oauth2] = :invalid_credentials
    sign_in_with_google_oauth
    expect(page).to have_content('Could not authenticate you from GoogleOauth2')
  end

  scenario 'Sign in with existing google account' do
    google_authenticate
    sign_in_with_google_oauth
    click_link 'Sign Out'
    click_link 'Sign in with GoogleOauth2'
    expect(page).to have_content('Artventory V0.0.0.0.0.2a')
  end
end
