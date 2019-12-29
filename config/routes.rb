# frozen_string_literal: true

Rails.application.routes.draw do
  # Devise (login/logout) for HTML Requests
  devise_for :users,
             defaults: { format: :html },
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             }

  # API namespace, for JSON requests at /api/signin OR /api/signout
  namespace :api do
    devise_for :users,
               defaults: { format: :json },
               class_name: 'ApiUser',
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'api/sessions'
               }
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
