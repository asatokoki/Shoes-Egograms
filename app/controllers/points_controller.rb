class PointsController < ApplicationController
  def create
    ActiveRecord::Base.transaction do
      @cp_point = CpPoint.new
      @cp_point.answerer_id = current_user.id
      @cp_point.evaluated_user_id = params[:evaluated_user_id]
      @cp_point.point = params[:cp_point]
      @cp_point.save!

      # end

      @np_point = NpPoint.new
      @np_point.answerer_id = current_user.id
      @np_point.evaluated_user_id = params[:evaluated_user_id]
      @np_point.point = params[:np_point]
      # if params[:np_point] != nil
      @np_point.save!
      # else
      # @user = User.find(params[:evaluated_user_id])

      # redirect_to user_path(@user.id) and return #and returnをつけることでここまでの処理で抜ける
      # end

      @a_point = APoint.new
      @a_point.answerer_id = current_user.id
      @a_point.evaluated_user_id = params[:evaluated_user_id]
      @a_point.point = params[:a_point]
      # if params[:a_point] != nil
      @a_point.save!
      # else
      # @user = User.find(params[:evaluated_user_id])

      # redirect_to user_path(@user.id) and return #and returnをつけることでここまでの処理で抜ける
      # end

      @fc_point = FcPoint.new
      @fc_point.answerer_id = current_user.id
      @fc_point.evaluated_user_id = params[:evaluated_user_id]
      @fc_point.point = params[:fc_point]
      # if params[:fc_point] != nil
      @fc_point.save!
      # else
      # @user = User.find(params[:evaluated_user_id])

      # redirect_to user_path(@user.id) and return #and returnをつけることでここまでの処理で抜ける
      # end

      @ac_point = AcPoint.new
      @ac_point.answerer_id = current_user.id
      @ac_point.evaluated_user_id = params[:evaluated_user_id]
      @ac_point.point = params[:ac_point]
      # if params[:ac_point] != nil
      @ac_point.save!
      # else
      # @user = User.find(params[:evaluated_user_id])

      # redirect_to user_path(@user.id) and return #and returnをつけることでここまでの処理で抜ける
      # end

      # redirect_to user_path(@cp_point.evaluated_user_id)cp_pointの引数でもどる。他の引数でもいい。
    end
    @user = User.find(params[:evaluated_user_id])
    redirect_to user_path(@user.id)

    # redirect_to user_path(@user.id) and return #an
  rescue => e
    # 失敗したら
    @user = User.find(params[:evaluated_user_id])
    redirect_to user_path(@user.id)
    # end
    # ↓それぞれの項目で分けていたときに使っていた。form_tagでまとめたことによって不要
    # private
    # def cp_point_params
    # params.require(:cp_point).permit(:point, :evaluated_user_id)
  end
end

# @cp_point = CpPoint.new
# @cp_point.point = params[:cp_point]
# @cp_point.save
