include Extensions::InstagramExtension

Instagram.configure do |config|
  config.client_id = Figaro.env.instagram_client_id 
  config.client_secret = Figaro.env.instagram_secret
  config.access_token = Figaro.env.instagram_token 
end