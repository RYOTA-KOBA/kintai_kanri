Rails.application.routes.draw do
  devise_for :employees, controllers: {
    sessions: 'employees/sessions',
    registrations: 'employees/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'attendances#index'
  resources :stores, only: [:index, :show, :new, :create, :destroy] do
    resources :employees, only: [:index, :show, :new, :create, :destroy]
  end
end
