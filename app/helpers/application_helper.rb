module ApplicationHelper

  def resource_name
    :student
  end

  def resource
    @resource ||= current_student
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:student]
  end

end
