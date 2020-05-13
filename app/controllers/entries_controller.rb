class EntriesController < ApplicationController

  before_action :authenticate_member!

    def index
      @entries = Entry.all.order(created_at: :desc)
    end
  
  
  def new
    @entry = Entry.new
  end
  
  def create
    @entry = Entry.new(entry_params)
    @entry.member = current_member
  
    if @entry.save
      flash[:success] = "News successfully published"
      redirect_to root_path
    end
  
  end # end create
  
  
  def show
    @entry = Entry.find(params[:id])
  end
  
  def edit
    @entry = Entry.find(params[:id])
  end
  
  
  def update
    @entry = Entry.find(params[:id])
  
    if @entry.update(entry_params)
      flash[:notice] = "News was successfully updated"
      redirect_to root_path
  
    else
      flash[:alert] = "Something went wrong..."
      render 'edit'
  
    end
  end
  
  def destroy
    @entry = Entry.find(params[:id])
  
    @entry.destroy
    flash[:notice] = "News was successfully deleted!"
    redirect_to root_path
  
  end # end destroy
  
  private
  
  def entry_params
    params.require(:entry).permit( :title, :description)
  end
  
  
  end
  