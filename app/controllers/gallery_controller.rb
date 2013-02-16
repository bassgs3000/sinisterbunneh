class GalleryController < ApplicationController
  def index
  	@posts = Post.all
    respond_to do |format|
      format.html
      format.json
    end
  end
end
