Galeria::Application.routes.draw do
  devise_for :users

  resources :galleries do
    get :pictures
  end
  root :to => 'galleries#index'
  resources :pictures
end


