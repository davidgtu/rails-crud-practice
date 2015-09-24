class TagsController < ApplicationController
  def show
    @entry = Entry.find_by(id: params[:id])
    @tag = Tag.find_by(id: params[:id])
  end
end
