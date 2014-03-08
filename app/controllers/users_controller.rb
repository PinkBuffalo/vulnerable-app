class UsersController < ApplicationController
  respond_to :json

  def create
    params.permit!
    user = User.create params[:user]
    respond_with user
  end

  def show
    user = User.find params[:id]
    respond_with user
  end
end
