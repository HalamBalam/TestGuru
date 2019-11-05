Rails.application.routes.draw do
  
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  resources :user_badges, only: %i[index show]
  resources :badges, only: %i[index show]

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end  
    end

    resources :gists, only: :index
    resources :badges
  end

  get '/feedback', to: 'feedback#new'
  post '/feedback', to: 'feedback#create'

end
