class CandidateMailer < ApplicationMailer
  def new_application(company, application)
    @application = application
    @company = company
    @url  = 'https://www.traineenandplus.com/companies/sign_in'
    mail(
      to: company.email,
      # from: "candidature_de_#{@application.student.first_name}@notreply.com",
      subject: "Nouvelle candidature - #{@application.offer.function}",
    )
  end

 
end
