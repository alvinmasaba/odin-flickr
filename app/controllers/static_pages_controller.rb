class StaticPagesController < ActionController::Base
  def index
    @flickr = Flickr.new

    unless params[:user_id].nil? || params[:user_id].empty?
      @photos = @flickr.photos.search(:user_id => params[:user_id])
                              .map { |photo| generate_url(photo.id) }
    end   
  end

  private

  def generate_url(id)
    info = @flickr.photos.getInfo(:photo_id => id)
    Flickr.url(info)
  end
end
