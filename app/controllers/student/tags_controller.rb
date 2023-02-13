class Student::TagsController < ApplicationController

  def create_multiple
    @tags = params[:tags].map do |tag_params|
      #  @tag = Tag.create(tag_params)
       # TODO: add validate and error messages.
       if Tag.create(tag_params)
         redirect_to student_dashboard_path(current_student), notice: "your domains have been sent !"
       else
         render 'student/dashboards', status: :unprocessable_entity
       end
    end
  end


  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_to student_dashboard_path(current_student), notice: "your domains have been sent !"
  end


  private

  def tag_params
    params.require(:tag).permit(:domaine)
  end

end
