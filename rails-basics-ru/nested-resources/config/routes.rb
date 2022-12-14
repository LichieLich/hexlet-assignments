# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    resources :comments, except: [:index],  module: :posts
  end  
  # END
end
