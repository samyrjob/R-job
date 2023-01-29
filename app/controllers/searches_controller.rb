class SearchesController < ApplicationController


  # def new
  #   @search = Search.new
  #   @towns = Offer.select(:town).map(&:town).uniq
  #   @sectors = Company.select(:sector).map(&:sector).uniq
  # end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end


  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :town, :min_salary, :start_date, :sector, :min_duration, :max_duration)
  end
end
