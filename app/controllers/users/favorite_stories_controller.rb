module Users
  class FavoriteStoriesController < ApplicationController
    respond_to :json

    def index
      @stories = User.find(index_params[:user_id]).favorite_stories
      respond_with @stories
    end

    def create
      @story = Story.find create_params[:id]
      @story.favorite_for User.find(create_params[:user_id])
      respond_with @story, location: ''
    end

    def destroy
      @story = Story.find create_params[:id]
      @story.unfavorite_for User.find(create_params[:user_id])
      respond_with @story, location: ''
    end

    private
      def index_params
        params.require(:user_id)
        params
      end

      def create_params
        index_params.require(:id)
        index_params
      end
  end
end
