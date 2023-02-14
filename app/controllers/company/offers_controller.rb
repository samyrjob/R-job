class Company::OffersController < ApplicationController




  def new
    @offer = Offer.new
    @company = current_company
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.company = current_company
    if @offer.save
      redirect_to "/", notice: "your application has been sent !"
    else
      render :new, status: :unprocessable_entity
    end


  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)

    if @offer.save
      redirect_to company_offer_path(@offer), notice: "your application has been updated !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show

    @offer = Offer.find(params[:id])

   @applications =  @offer.applications.where(status: "pending")
   @applications1 =  @offer.applications.where(status: "accepted")
   @applications2 = @offer.applications.where(status: "nokept")
   @applications3 = @applications1 + @applications2
   @applications4 = @offer.applications.where(status: "kept")

    capacity = @offer.start_date.month

    case capacity
    when 1
      @month = "Janvier"
    when 2
      @month = "Février"
    when 3
      @month = "Mars"
    when 4
      @month = "Avril"
    when 5
      @month = "Mai"
    when 6
      @month = "Juin"
    when 7
      @month = "Juillet"
    when 8
      @month = "Août"
    when 9
      @month = "Septembre"
    when 10
      @month = "Octobre"
    when 11
      @month = "Novembre"
    else
      @month = "Décembre"
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to company_dashboard_path, status: :see_other, notice: "L'annonce a bien été supprimée !"
  end




  private

  def offer_params
    params.require(:offer).permit(:description, :function, :town, :salary, :duration, :start_date, images: [])
  end

end
