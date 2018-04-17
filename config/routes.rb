# frozen_string_literal: true

Rails.application.routes.draw do
  # RESTful routes
  resources :users_boxes, except: %i[new edit]
  resources :boxes, except: %i[new edit]
  resources :items, except: %i[new edit]
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  # twilio route
  post 'twilio/voice' => 'twilio#voice'
  post 'twilio/text' => 'twilio#text'
end
