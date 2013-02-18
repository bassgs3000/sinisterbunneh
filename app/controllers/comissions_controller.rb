class ComissionsController < ApplicationController
  def index
    @comission = Comission.all.last
  end

  def show
    @comission = Comission.all.last
  end

  def edit
    @comission = Comission.all.last
  end

  def update
    @comission = Comission.all.last
  end

  def new
    @comission = Comission.new
    respond_to do |format|
      if user_signed_in?
        format.html
        format.json { render json: @comission }
      else
        format.html { redirect_to new_user_session_path, alert: 'Please sign in to add a comission' }
        format.json { render :layout=>false }
      end
    end
  end

  def create
    @comission = Comission.new(params[:comission])
    respond_to do |format|
      if @post.save
        format.html { redirect_to comissions_path, notice: 'Comission was successfully created. Do not make more.' }
        format.json { render json: comissions_path, status: :created, location: @comission }
      else
        format.html { render action: "new" }
        format.json { render json: @comission.errors, status: :unprocessable_entity }
      end
    end
  end
end
