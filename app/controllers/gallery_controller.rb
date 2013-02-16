class GalleryController < ApplicationController
  def index
  	@posts = Post.all
  	@news = News.all
    respond_to do |format|
      format.html
      format.json
    end
  end
end
