Rails.application.routes.draw do
  root 'home#index'
  get 'auth/callback', to: 'home#auth_callback'
end
