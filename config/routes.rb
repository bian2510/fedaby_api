Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'

  # Route for profile
  resources :profile, only: [:show]

  # Route for find articles by title
  get 'find_articles', to: :find_articles_by_title, controller: :articles

  # Routes for articles
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end