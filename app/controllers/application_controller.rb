class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    if resource.class == Student
      student_dashboard_path
    elsif resource.class == Company
      company_dashboard_path
    end
  end



  # def after_sign_out_path_for(scope)
  #   # return the path based on scope
  #   student_dashboard_path(scope)
  # end

end
