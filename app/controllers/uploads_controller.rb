class UploadsController < ApplicationController
  accept_api_auth :upload

  skip_before_filter :verify_authenticity_token
  ROOT = File.join(Rails.root, 'files', 'upload')

  def index
    @files = Dir[File.join(ROOT, '*')].sort do |a,b|
      File.mtime(b) <=> File.mtime(a)
    end.map do |file|
      {
        :name => File.basename(file),
        :size => File.size(file),
        :date => File.mtime(file)
      }
    end
    if request.xhr?
      render :partial => "files"
    else
      render :action => :index
    end
  end

  INLINE = ['.jpg', '.jpeg', '.png', '.gif', '.txt', '.php', '.html',
    '.js', '.json', '.xml', '.csv', '.yml', '.ini', '.sql', '.css']

  def file
    file = File.join(ROOT, File.basename(params[:filename]))
    disposition = INLINE.include?(File.extname(file).downcase) ? 'inline' : 'attachment'
    send_file file, :filename => File.basename(params[:filename]), :disposition => disposition
  end

  def delete
    file = File.join(ROOT, File.basename(params[:filename]))
    File.unlink(file) if File.exists?(file)
    redirect_to :action => :index
  end

  def upload
    name = File.basename(params[:file].original_filename)
    dest = File.join(ROOT, name)
    Dir.mkdir(ROOT) if not File.exists?(ROOT)
    File.unlink(dest) if File.exists?(dest)
    FileUtils.mv(params[:file].tempfile.path, dest)
    render :text => name.to_json, :status => 200
  end

end
