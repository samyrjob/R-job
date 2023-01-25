class Company::DashboardsController < ApplicationController
  before_action :set_company, only: [:show]
  skip_before_action :authenticate_company!, only: %i[show ]
  skip_before_action :authenticate_student!, only: %i[show ]

  def show
    @offers = Offer.where(company: @company)
    # @offers = @company.offers
    @applications = Application.includes(:offer).where(offers: { company: @company })
  end

  private

  def set_company
    @company = current_company
  end
end
