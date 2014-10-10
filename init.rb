Redmine::Plugin.register :redmine_drop_upload do
  name 'Redmine Drop Upload plugin'
  author 'Author name'
  description 'Add a global place to upload/drop any file'
  version '0.0.1'
  url 'https://github.com/florentsolt/redmine_drop_upload'

  menu :top_menu, :uploads, { :controller => 'uploads', :action => 'index' }, :caption => 'Uploads'
  permission :uploads, {:uploads => [:index, :file] }, :public => true
end