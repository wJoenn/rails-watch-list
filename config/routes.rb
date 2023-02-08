Rails.application.routes.draw do
  resources :lists, only: %i[index show create] do
    resources :bookmarks, only: %i[create]
    resources :reviews, only: %i[create]
  end

  resources :bookmarks, only: %i[destroy]
end
