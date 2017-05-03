Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/', to: 'home#index'
      resources :customers, only: %i[index] do
        collection do
          post :register
        end
      end
    end
  end
end
