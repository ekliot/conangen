Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # You can have the root of your site routed with "root"
  root                      "application#home"
  get     'about'       =>  'application#about'

  resources :characters, as: 'chars' do
    get 'lifepath', :on => :new
    get 'random', :on => :new
  end

  get 'characters/export/:id', to: 'characters#export', as: 'export_char'

  # constraints( id: MATCH? ID-HASH ) do
  #   resources :characters
  # end

  get     'login'       =>  'users#login'
  get     'signup'      =>  'users#new'
  post    'signup'      =>  'users#create'
  get     'account'     =>  'users#account'
  patch   'account'     =>  'users#edit'
  delete  'account'     =>  'users#destroy'

end
