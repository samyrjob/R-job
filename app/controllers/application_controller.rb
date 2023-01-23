class ApplicationController < ActionController::Base
  before_action :authenticate_company!
  before_action :authenticate_student!
end
