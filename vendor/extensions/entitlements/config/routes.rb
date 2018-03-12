Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :entitlements do
    resources :entitlements, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :entitlements, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :entitlements, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
