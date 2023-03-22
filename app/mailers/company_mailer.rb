class CompanyMailer < ApplicationMailer
  default from: 'services_entreprises@traineenandplus.com'

  def welcome_email
    @company = params[:company]
    @url  = 'https://www.traineenandplus.com/companies/sign_in'
    attachments['Conditions.pdf'] = File.read('app/assets//Conditions.pdf')
    mail(to: @company.email, subject: 'Bienvenue à Trainee +')
  end


end
