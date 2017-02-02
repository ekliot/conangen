Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # You can have the root of your site routed with "root"
  root            'application#home'
  get  'about' => 'application#about'

  resources :characters, as: 'chars' do
    # TODO learn routing and DRY this up
    get 'lifepath', :on => :new
    get 'random',   :on => :new
    get 'select_lifepath', :on => :new
    get 'get_char_title', :on => :new
  end

  get 'characters/export/:id', to: 'characters#export', as: 'export_char'

  # constraints( id: MATCH? ID-HASH ) do
  #   resources :characters
  # end

  get     'login'       =>  'users#login'
  post    'login'       =>  'users#session_create'
  delete  'logout'      =>  'users#session_delete'
  get     'signup'      =>  'users#new'
  post    'signup'      =>  'users#create'
  get     'account'     =>  'users#account'
  patch   'account'     =>  'users#edit'
  delete  'account'     =>  'users#destroy'

end
