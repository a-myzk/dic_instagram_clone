Rails.application.routes.draw do
  get 'sessions/new'
  get './favorites', to: 'favirites#index'
  root 'pictures#index'
  resources :pictures do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :favorites, only: [:index, :create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/inbox"
end
