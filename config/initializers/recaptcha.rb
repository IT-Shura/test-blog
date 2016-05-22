Recaptcha.configure do |config|
  config.public_key  =  ENV['RECAPTCHA_PUBLIC_KEY'] || Rails.application.secrets.recaptcha_public
  config.private_key =  ENV['RECAPTCHA_PRIVATE_KEY'] || Rails.application.secrets.recaptcha_private 
end