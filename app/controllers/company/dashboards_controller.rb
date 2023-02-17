class Company::DashboardsController < ApplicationController
  before_action :set_company, only: [:show]


  def show
    @offers = Offer.where(company: @company)
    # @offers = @company.offers
    @applications = Application.includes(:offer).where(offers: { company: @company })

    @all_offers = Offer.where(status: "pending")
    

  end

  private

  def set_company
    @company = current_company
  end
end
