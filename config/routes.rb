Rails.application.routes.draw do
  get './pictures', to: 'pictures#index'
  resources :pictures do
    collection do
      post :confirm
    end
  end    
end
