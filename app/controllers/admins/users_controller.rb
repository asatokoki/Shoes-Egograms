class Admins::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(9)
  end
end
