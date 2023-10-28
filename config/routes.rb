# frozen_string_literal: true

Rails.application.routes.draw do
  scope 'api/v1', defaults: { format: :json } do
    devise_for :users, controllers: {
      sessions: 'api/v1/sessions'
    }, default: { format: :json }
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :businesses, only: %i[create update index]
      resources :orders, only: %i[create update index]
      resources :purchases, only: %i[index]
    end
  end

  match '*unmatched_route', to: 'application#route_not_found', via: :all
end
