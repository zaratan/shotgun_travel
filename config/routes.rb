# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips, only: %i[create index destroy update show] do
    resources :pictures, only: %i[index create destroy]
  end

  root 'trips#index'
end
