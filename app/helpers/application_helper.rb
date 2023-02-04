module ApplicationHelper

  # def resource_name
  #   :student || :company
  # end

  # def resource
  #   @resource ||= current_student
  # end

  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:student]
  # end

  def resource_name

    if student_signed_in?
      :student
    else
      :company
    end
  end

  def resource
    if student_signed_in?
        @resource ||= student_company
    else
        @resource ||= current_company
    end
  end

  def devise_mapping
    if student_signed_in?
      @devise_mapping ||= Devise.mappings[:student]
    else
      @devise_mapping ||= Devise.mappings[:company]
    end
  end

end
