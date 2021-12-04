class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @questions = ["あなたは人を許せませんか？","あなたは怒りっぽいですか？","あなたは寡黙ですか？","あなたは怖いですか？"]
  end
end
