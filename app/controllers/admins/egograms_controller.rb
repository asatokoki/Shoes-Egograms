class Admins::EgogramsController < ApplicationController
  def index
    @egograms = Egogram.all
    @egogram = Egogram.new
  end

  def create
    @egogram = Egogram.new(egogram_params)
    if @egogram.save
      redirect_to admins_egograms_path
    else
      redirect_to admins_egograms_path
    end
  end

  def show
    @egogram = Egogram.find(params[:id])
  end

  def edit
    @egogram = Egogram.find(params[:id])
  end

  def update
    @egogram = Egogram.find(params[:id])
    @egogram.update(egogram_params)
    redirect_to admins_egogram_path
  end

  def destroy
    @egogram = Egogram.find(params[:id])
    @egogram.destroy
    redirect_to root_path
  end

  private

  def egogram_params
    params.require(:egogram).permit(:type_name, :strong_point_title, :strong_point_body, :weak_point_title, :weak_point_body, :advice_title, :advice_body, :egogram_image)
  end
end
