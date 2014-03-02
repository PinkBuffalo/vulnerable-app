class StoriesController < ApplicationController
  respond_to :json

  def index
    @stories = Story.recent
    respond_with @stories
  end
end
