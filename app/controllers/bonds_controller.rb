class BondsController < ApplicationController
  def index
    @bonds = Bond.where(mat_date: (Date.current..Date.current.next_year(2))).order(coupon_date: :desc)
  end
end