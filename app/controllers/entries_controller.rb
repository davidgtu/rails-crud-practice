class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to entry_path(@entry.id)
    else
      render :new
    end
  end

  def show
    @entry = Entry.find_by(id: params[:id])
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :content)
  end
end
