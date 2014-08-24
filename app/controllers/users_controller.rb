class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @users = User.find(params[:id])
    render json: @users, status: :ok
  end
end
