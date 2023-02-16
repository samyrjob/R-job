
class Company::CommentsController < ApplicationController

before_action :set_application, only: %i[new create]
before_action :set_company, only: %i[create]





def create
  @application = Application.find(params[:application_id])
  @comment = Comment.new(comment_params)
  @comment.application = @application
  @comment.company = current_company
 @company =  Company.find(@comment.application_id)

  # if @comment.save
  #   redirect_to company_application_path(@application), notice: "Commentaire publié"
  # else
  #   render "company/applications/show", status: :unprocessable_entity
  # end

  @comment.save

  redirect_to company_application_path(@application), notice: "The offer has been saved !"
  raise
end

private

def set_application
  @application = Application.find(params[:application_id])
end



def set_company
  @company = current_company
end



def comment_params
  params.require(:comment).permit(:content, :company_id, :application_id)
end


end
