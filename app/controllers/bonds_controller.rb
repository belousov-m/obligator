class BondsController < ApplicationController
  before_action :set_resource, only: %i[show]

  def index
    @bonds = Bond.where(
      type_name: 'ОФЗ',
      mat_date: (Date.current..Date.current.next_year(3)),
      coupon_date: (Date.current..Date.current.next_year(3))
    ).order(coupon_date: :asc)
  end

  def show; end

  private

  def set_resource
    @bond = Bond.find(params[:id])
  end
end
