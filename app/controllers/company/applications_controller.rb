class Company::ApplicationsController < ApplicationController




  def accept

    @applications = Application.includes(:offer).where(offers: { company: current_company})
    @application = Application.find(params[:id])
    @application.update(:status => 'accepted')
    redirect_to company_dashboard_path


  end

  def decline
    @applications = Application.includes(:offer).where(offers: { company: current_company })
    @application = Application.find(params[:id])
    @application.update(:status => 'declined')
    redirect_to company_dashboard_path
  end


  private



  def application_params
    params.require(:application).permit(:id)
  end


end
