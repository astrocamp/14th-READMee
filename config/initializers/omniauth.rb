Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, Rails.application.credentials.google[:user_number], Rails.application.credentials.google[:api_key], skip_csrf: true
  end
  