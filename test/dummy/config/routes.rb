Dummy::Application.routes.draw do

  root :to => "main#index"

  resources :images
  resources :audios

end
