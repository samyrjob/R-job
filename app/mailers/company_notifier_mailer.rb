class CompanyNotifierMailer < ApplicationMailer
  default :from => 'notreson@hotmail.fr'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(company)
    @company = company
    mail( :to => @company.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
