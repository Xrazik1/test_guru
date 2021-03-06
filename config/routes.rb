# frozen_string_literal: true

Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  resources :tests, only: :index do
    resources :questions, shallow: true, only: :show do
      resources :answers, shallow: true, only: :show
    end

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

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
  end

  resources :feedbacks, only: %i[new create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
