Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # defaults to dashboard
  root to: redirect('/dashboard')
  get '/dashboard' => 'dashboard#index'

  resources :projects, except: [:index, :show] do
    resources :issues
  end
end
