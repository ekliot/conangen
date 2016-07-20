Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # You can have the root of your site routed with "root"
  root                      "application#home"
  get     'about'       =>  'application#about'

  get     'new'         =>  'characters#new'         # choose b/w random and manual generation
  get     'create'      =>  'characters#create'      # manually create a new character
  post    'create'      =>  'characters#create'      # save a manual character
  get     'random'      =>  'characters#random'      # roll a random character
  get     'chars'       =>  'characters#index'
  get     'view/:id'    =>  'characters#view'
  get     'edit/:id'    =>  'characters#edit'
  get     'delete/:id'  =>  'characters#delete'
  get     'export/:id'  =>  'characters#export'

  get     'login'       =>  'users#login'
  get     'signup'      =>  'users#new'
  post    'signup'      =>  'users#create'
  get     'account'     =>  'users#account'
  patch   'account'     =>  'users#edit'
  delete  'account'     =>  'users#destroy'

end
