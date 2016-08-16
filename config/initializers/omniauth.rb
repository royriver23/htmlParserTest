# config/initializers/omniauth.rb
::OmniAuthConfig = Proc.new do
  provider :google_oauth2, 
    '52944667050-ae9helq3hc65s88nquulka49vsu3svlf.apps.googleusercontent.com', 
    '4A8W6HwwqJTmB9wPnBb8-6lx'
end
