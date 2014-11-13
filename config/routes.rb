Bloccit::Application.routes.draw do
 
  get "comments/new"
  devise_for :users
    resources :users, only: [:update]

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  end
  
  get 'about' => 'welcome#about'
  
  root to: 'welcome#index'
end
