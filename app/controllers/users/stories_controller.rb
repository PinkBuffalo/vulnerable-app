module Users
  class StoriesController < ApplicationController
    respond_to :json

    def index
      @stories = User.find(index_params[:user_id]).stories
      respond_with @stories
    end

    def create
      user = User.find crate_params[:user_id]
      @story = user.stories.create crate_params[:story]
      respond_with @story, location: ''
    end

    private
      def base_params
        params.require(:user_id)
        params
      end

      alias_method :index_params, :base_params

      def crate_params
        base_params.require(:story).permit(:body)
      end
  end
end
