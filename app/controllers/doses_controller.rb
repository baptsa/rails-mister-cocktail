class DosesController < ApplicationController

# before_action :set_dose

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.find(dose_params)
    @cocktail.dose = @dose
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktail/show'
    end
  end

  def destroy
    @cocktail.dose.delete
    redirect_to cocktail_path(@cocktail)
  end



private

  def dose_params
    params.require(:dose).permit(:description)
  end

  # def set_dose
  #   @dose = Dose.find(params[:dose_id])
  # end






end
