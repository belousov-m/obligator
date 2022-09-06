class BondsController < ApplicationController
  def index
    @bonds = Bond.where(
      mat_date: (Date.current..Date.current.next_year(3)),
      coupon_date: (Date.current..Date.current.next_year(3))
    ).order(coupon_date: :asc)
  end
end