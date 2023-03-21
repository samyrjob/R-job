class StudentMailer < ApplicationMailer
  default from: 'contact@traineenandplus.com'

  def welcome_email
    @student = params[:student]
    @url  = 'https://www.traineenandplus.com/students/sign_in'
    attachments['Conditions.pdf'] = File.read('app/assets//Conditions.pdf')
    mail(to: @student.email, subject: 'Bienvenue à Trainee +')
  end

end
