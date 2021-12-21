class EgogramsController < ApplicationController
  def index
    @egograms = Egogram.page(params[:page]).per(9)
    @egogram = Egogram.new
  end

  # def create
  # @egogram = Egogram.new(egogram_params)
  # @egogram.save
  # redirect_to egograms_path
  # end

  def show
    @egogram = Egogram.find(params[:id])
  end

  # ユーザーの方からはエゴグラムを投稿しないので必要ない
  # def egogram_params
  # params.require(:egogram).permit(:type_name, :strong_point_title, :strong_point_body, :weak_point_title, :weak_point_body, :advice_title, :advice_body, :egogram_image)
  # end
end
