class CpPointsController < ApplicationController
  def create #{cp_poin: 1, np_point: 0, xx_point: 5, evaluted_user_id: 3}

    @cp_point = CpPoint.new
    @cp_point.answerer_id = current_user.id
    @cp_point.evaluated_user_id =  params[:evaluated_user_id]
    @cp_point.point = params[:cp_point]
    @cp_point.save

    @np_point = NpPoint.new
    @np_point.answerer_id = current_user.id
    @np_point.evaluated_user_id =  params[:evaluated_user_id]
    @np_point.point = params[:np_point]
    @np_point.save

    @xx_point = xxPoint.new
    @xx_point.answerer_id = current_user.id
    @xx_point.evaluated_user_id =  params[:evaluated_user_id]
    @xx_point.point = params[:xx_point]
    @xx_point.save


    redirect_to root_path
  end

  #private
  #def cp_point_params
  	#params.require(:cp_point).permit(:point, :evaluated_user_id)
  #end

end

@cp_point = CpPoint.new
@cp_point.point = params[:cp_point]
@cp_point.save