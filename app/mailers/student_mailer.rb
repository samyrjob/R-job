class StudentMailer < ApplicationMailer
  default from: 'contact@traineenandplus.com'

  def welcome_email
    @student = params[:student]
    @url  = 'https://www.traineenandplus.com/students/sign_in'
    mail(to: @student.email, subject: 'Welcome to My Awesome Site')
  end

end
