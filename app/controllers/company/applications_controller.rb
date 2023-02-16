class Company::ApplicationsController < ApplicationController




  def accept

    @applications = Application.includes(:offer).where(offers: { company: current_company})
    @application = Application.find(params[:id])
    @application.update(:status => 'accepted')
    redirect_to company_offer_path(@application.offer), notice: "La candidature est désormais en process !"


  end

  def decline

    @applications = Application.includes(:offer).where(offers: { company: current_company })
    @application = Application.find(params[:id])
    @application.update(:status => 'declined')
    redirect_to company_offer_path(@application.offer), notice: "La candidature a bien été écartée!"
  end

  def keep

    @applications = Application.includes(:offer).where(offers: { company: current_company })
    @application = Application.find(params[:id])
    @application.update(:status => 'kept')
    redirect_to company_offer_path(@application.offer), notice: "La candidature a bien été retenue"
  end

  def nokeep

    @applications = Application.includes(:offer).where(offers: { company: current_company })
    @application = Application.find(params[:id])
    @application.update(:status => 'nokept')
    redirect_to company_offer_path(@application.offer), notice: "La candidature a bien été écartée!"
  end

  def index
    @offers = Offer.where(company_id: current_company.id)
    @applications = Application.includes(:offer).where(offers: { company: current_company })
  end

  def show
    @application = Application.find(params[:id])
    @comment = Comment.new
  end

  private



  def application_params
    params.require(:application).permit(:id)
  end


end
