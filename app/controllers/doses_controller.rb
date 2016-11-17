class DosesController < ApplicationController

# before_action :set_dose

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(doses_params)


    if @dose.save
      redirect_to cocktail_path
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.dose
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end



private

  def doses_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  # def set_dose
  #   @dose = Dose.find(params[:dose_id])
  # end






end
