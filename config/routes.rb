Rails.application.routes.draw do
  scope module: 'api' do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
        resources :parsed_sites, except: [:new, :edit]
      end
    end
end
