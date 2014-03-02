class User::FavoriteStoriesController < ApplicationController
  def index
    @stories = User.find(index_params[:user_id]).favorite_stories
    render json: @stories.to_json
  end

  private
    def index_params
      params.require(:user_id)
      params.permit(:user_id)
      params
    end
end
