class CommissionsController < ApplicationController
  def index
    #Check if Table is empty, if it is, make an entry.
    @commission = Commission.first_or_create
  end

  def show
    redirect_to commissions_path
  end

  def edit
    @commission = Commission.first_or_create
    respond_to do |format|
      if user_signed_in?
        format.html
        format.json { render json: @commission }
      else
        format.html { redirect_to new_user_session_path, alert: 'Please sign in to edit the commission' }
        format.json { render :layout=>false }
      end
    end
  end

  def update
    @commission = Commission.first_or_create
    respond_to do |format|
      if @commission.update_attributes(params[:commission])
        format.html { redirect_to commissions_path, notice: 'Commission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @commission = Commission.new
    respond_to do |format|
      if user_signed_in?
        format.html
        format.json { render json: @commission }
      else
        format.html { redirect_to new_user_session_path, alert: 'Please sign in to add a commission' }
        format.json { render :layout=>false }
      end
    end
  end

  def create
    @commission = Commission.new(params[:commission])
    respond_to do |format|
      if @post.save
        format.html { redirect_to commissions_path, notice: 'Commission was successfully created. Do not make more.' }
        format.json { render json: commissions_path, status: :created, location: @commission }
      else
        format.html { render action: "new" }
        format.json { render json: @commission.errors, status: :unprocessable_entity }
      end
    end
  end
end
