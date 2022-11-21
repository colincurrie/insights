Rails.application.routes.draw do
  root 'home#index'
  get 'auth/callback', to: 'home#auth_callback'
  get 'privacy_policy', to: 'home#privacy_policy'
  get 'contact', to: 'home#contact'
end
