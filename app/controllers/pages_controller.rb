class PagesController < ApplicationController

  def home
  end

  def download_pdf
    send_file(
      "#{Rails.root}/app/assets/images/Conditions.pdf",
       filename: "Conditions.pdf",
       type: "application/pdf"
    )
  end

end
