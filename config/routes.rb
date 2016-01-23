Rails.application.routes.draw do

  root "main#index"
  devise_for :users
  resources :images do
    member do
      patch 'add_tag'
      patch 'remove_tag'
    end
  end

end
