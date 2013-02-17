class GalleryController < ApplicationController
  def index
    @posts = Post.order('created_at DESC').page(params[:page]).per_page(12)
    @news = News.all
    respond_to do |format|
      format.html
      format.json
    end
  end
end
