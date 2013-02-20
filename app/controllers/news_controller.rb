class NewsController < ApplicationController
  def index
    @news = News.all
    respond_to do |format|
      format.html
      format.json { render json: @news }
    end
  end

  def new
    @news = News.new
    respond_to do |format|
      if user_signed_in?
        format.html
        format.json { render json: @news }
      else
        format.html { redirect_to new_user_session_path, alert: 'Please sign in to add a news entry' }
        format.json { render :layout=>false }
      end
    end
  end

  def create
    @news = News.create(params[:news])
    respond_to do |format|
      if @news.save
        format.html { redirect_to news_path(@news), notice: 'News entry was successfully created.' }
        format.json { render json: news_path(@news), status: :created, location: @news }
      else
        format.html { render action: "new" }
        format.json { render json: @news.errors, notice: :unprocessable_entity }
      end
    end
  end

  def show
    @news = News.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @news }
    end
  end

  def edit
    @news = News.find(params[:id])
    respond_to do |format|
      if user_signed_in?
        format.html
        format.json { render json: @news }
      else
        format.html { redirect_to new_user_session_path, alert: 'Please sign in to edit a news entry' }
        format.json { render :layout=>false }
      end
    end
  end

  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to @news, notice: 'News entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to news_index_path, notice: "Successfully deleted #{@news.title}" }
      format.json { head :no_content }
    end
  end
end
