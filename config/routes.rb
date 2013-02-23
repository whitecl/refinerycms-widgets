Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :widgets do
    resources :widgets, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :widgets, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :widgets, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
