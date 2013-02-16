class PostsController < ApplicationController
  def index
    redirect_to gallery_path
  end

  def new
    @post = Post.new
    respond_to do |format|
      if user_signed_in?
        format.html
        format.json { render json: @post }
      else
        format.html { redirect_to new_user_session_path, alert: 'Please sign in to add a post' }
        format.json { render :layout=>false }
      end
    end
  end

  def create
    @post = Post.create(params[:post])
    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.json { render json: posts_path, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      if user_signed_in?
        format.html
        format.json { render json: @post }
      else
        format.html { redirect_to new_user_session_path, alert: 'Please sign in to edit a post' }
        format.json { render :layout=>false }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to gallery_path, notice: "Successfully deleted #{@news.title}" }
      format.json { head :no_content }
    end
  end
end
