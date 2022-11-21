Rails.application.routes.draw do
  root 'home#index'
  get  'auth/callback',  to: 'home#auth_callback'
  get  'privacy_policy', to: 'home#privacy_policy'
  get  'contact',        to: 'home#contact'
  get  'data_deletion',  to: 'home#data_deletion'
end
