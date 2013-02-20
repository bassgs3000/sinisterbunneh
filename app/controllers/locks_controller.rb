class LocksController < ApplicationController

  def index
    @lock = Lock.first_or_create

    respond_to do |format|
      format.html 
      format.json { render json: @locks }
    end
  end

  def show
    @lock = Lock.first_or_create

    respond_to do |format|
      format.html 
      format.json { render json: @lock }
    end
  end

  def new
    @lock = Lock.new

    respond_to do |format|
      format.html 
      format.json { render json: @lock }
    end
  end

  
  def edit
    @lock = Lock.first_or_create
  end

  def create
    @lock = Lock.new(params[:lock])

    respond_to do |format|
      if @lock.save
        format.html { redirect_to @lock, notice: 'Lock was successfully created.' }
        format.json { render json: @lock, status: :created, location: @lock }
      else
        format.html { render action: "new" }
        format.json { render json: @lock.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @lock = Lock.first_or_create

    respond_to do |format|
      if @lock.update_attributes(params[:lock])
        format.html { redirect_to @lock, notice: 'Lock was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lock = Lock.find(params[:id])
    @lock.destroy

    respond_to do |format|
      format.html { redirect_to locks_url }
      format.json { head :no_content }
    end
  end
end
