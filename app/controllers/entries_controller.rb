class EntriesController < ApplicationController
  def index
    @entries = Entry.all
    @tags = Tag.all
  end

  def new
    @entry = Entry.new
    @tag = Tag.new
  end

  def create
    @entry = Entry.new(entry_params)
    @tag = Tag.new(tag_params)
    if @entry.save && @tag.save
      redirect_to action: "index"
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

  def tag_params
    params.require(:tag).permit(:body)
  end
end
