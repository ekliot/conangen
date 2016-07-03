Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # You can have the root of your site routed with "root"
  root "application#home"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'chars'      => 'characters#index'
  get 'view/:id'   => 'characters#view'
  get 'edit/:id'   => 'characters#edit'
  get 'delete/:id' => 'characters#delete'
  get 'export/:id' => 'characters#export'

  get 'login'      => 'users#login'
  get 'signup'     => 'users#new'

  get 'about'      => 'application#about'

  resources :users

end
