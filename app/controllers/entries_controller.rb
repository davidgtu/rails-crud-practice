class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    @entry = Entry.new
    @tag = Tag.new
  end

  def create
    @entry = Entry.new(entry_params)
    @tag = @entry.tags.new(tag_params)
    if @entry.save && @tag.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  def show
    @entry = Entry.find_by(id: params[:id])
  end

  def edit
    @entry = Entry.find_by(id: params[:id])
  end

  def update
    @entry = Entry.find_by(id: params[:id])
    if @entry.update_attributes(entry_params)
      redirect_to @entry
    else
      render 'edit'
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:name, :content)
  end

  def tag_params
    params.require(:tag).permit(:body)
  end
end
