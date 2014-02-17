class UsersController < ApplicationController
  respond_to :json

  def create
    user = User.create params[:users]
    respond_with user
  end

  def show
    user = User.find params[:id]
    respond_with user
  end
end
