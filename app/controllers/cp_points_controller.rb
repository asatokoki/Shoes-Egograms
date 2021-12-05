class CpPointsController < ApplicationController
  def create #{cp_poin: 1, np_point: 0, a_point: 5, evaluted_user_id: 3}
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

    @a_point = APoint.new
    @a_point.answerer_id = current_user.id
    @a_point.evaluated_user_id =  params[:evaluated_user_id]
    @a_point.point = params[:a_point]
    @a_point.save

    @fc_point = FcPoint.new
    @fc_point.answerer_id = current_user.id
    @fc_point.evaluated_user_id =  params[:evaluated_user_id]
    @fc_point.point = params[:fc_point]
    @fc_point.save

    @ac_point = AcPoint.new
    @ac_point.answerer_id = current_user.id
    @ac_point.evaluated_user_id =  params[:evaluated_user_id]
    @ac_point.point = params[:ac_point]
    @ac_point.save



    redirect_to root_path
  end
  #↓それぞれの項目で分けていたときに使っていた。form_tagでまとめたことによって不要
  #private
  #def cp_point_params
  	#params.require(:cp_point).permit(:point, :evaluated_user_id)
  #end

end

# @cp_point = CpPoint.new
# @cp_point.point = params[:cp_point]
# @cp_point.save