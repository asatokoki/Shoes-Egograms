class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    #↓これはform_withの時にモデルに送るためにインスタンス変数を用意してた
    #@cp_point = CpPoint.new

    @cp_questions = ["あなたは人を許せませんか？","あなたは怒りっぽいですか？","あなたは寡黙ですか？","あなたは怖いですか？"]
    @np_questions = ["あなたは優しいですか？", "あなたに母性はありますか？"]
    @a_questions = ["あなたは大人ですか？", "あなたは達観していますか？"]
    @fc_questions = ["あなたは自由人ですか？", "あなたは子供ですか？"]
    @ac_questions = ["あなたは女の子ですか？", "あなたはママごとが好きですか？"]
    @chart_data = []
    [CpPoint, NpPoint, APoint, FcPoint, AcPoint].each do |model|
      @values = []
      # 各ポイントテーブルのポイント合計を取得してレコードがあれば値をいれる。なければ０を入れる。
      # .group（評価されるユーザーごとに集計したい）
      
      if model.group(:evaluated_user_id).where(evaluated_user_id: @user.id).select("sum(point) as point").length > 0
        @values = [model.to_s, model.group(:evaluated_user_id).where(evaluated_user_id: @user.id).select("sum(point) as point")[0][:point]]
      else
        @values = [model.to_s, 0]
      end
      @chart_data.push(@values)
    end
    # やりたいことはこれ
    # @chart_data = [
    #  ["CpPoint", 10],
    #  ["NpPoint", 1],
    #  ["APoint", 15],
    #  ["FcPoint", 13],
    #  ["AcPoint", 12],
    # ]


  end

  def update
    @user = User.find(params[:id])
    @cp_point.update(cp_point_params)
    redirect_to  user_path(current_user)
  end


end
