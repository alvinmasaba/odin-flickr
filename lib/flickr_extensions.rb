class Flickr
  def generate_urls(id)
    info = self.photos.getInfo(:photo_id => id)

    self.url_o(info)
  end
end
