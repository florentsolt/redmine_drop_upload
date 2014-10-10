# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

match '/uploads', :to => 'uploads#index'
match '/uploads/file/:filename', :to => 'uploads#file', :filename => /.*/
match '/uploads/upload', :to => 'uploads#upload'
match '/uploads/delete/:filename', :to => 'uploads#delete', :filename => /.*/
