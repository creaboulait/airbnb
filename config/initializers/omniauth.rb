# In config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET'],
 {
 	scope: 'email, profile',
 	prompt: 'select_account',
 	image_aspect_ratio: 'square',
 	image_size: 50,
 	access_type: 'online',
 	skip_jwt: true
 }

end
