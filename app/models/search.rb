class Search < ApplicationRecord
  def search_offers
    offers = Offer.all


    offers = offers.where(["function ILIKE ?","%#{keywords}%"]) if keywords.present?
    offers = offers.joins(:company).where(["sector ILIKE ?", sector]) if sector.present?
    offers = offers.where(["town LIKE ?",town]) if town.present?
    offers = offers.where(["duration >= ?",min_duration]) if min_duration.present?
    offers = offers.where(["duration <=?",max_duration]) if max_duration.present?
    offers = offers.where(["salary >= ?",min_salary]) if min_salary.present?
    offers = offers.where(["start_date >= ?", start_date]) if start_date.present?

    return offers
  end
end
