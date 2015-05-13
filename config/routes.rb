# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match '/uploads', :to => 'uploads#index', :via => :get
match '/uploads/file/:filename', :to => 'uploads#file', :filename => /.*/, :via => :get
match '/uploads/upload', :to => 'uploads#upload', :via => :post
match '/uploads/delete/:filename', :to => 'uploads#delete', :filename => /.*/, :via => :get
