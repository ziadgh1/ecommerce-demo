Rails.application.routes.draw do
  # MUST be declared before the mount ForestLiana::Engine.
  namespace :forest do
    post '/actions/mark-as-delivered' => 'orders#mark_as_delivered'
  end
  mount ForestLiana::Engine => '/forest'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
