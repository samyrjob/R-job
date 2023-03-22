class StudentNotifierMailer < ApplicationMailer
  default :from => 'services_entreprises@traineenandplus.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(student)
    # logger.debug "caca gros"
    @student = student
    mail( :to => @student.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
