class AddBondTable < ActiveRecord::Migration[6.1]
  def change
    create_table :bonds do |t|
      t.string  :name
      t.string  :shortname
      t.string  :isin
      t.integer :face_value
      t.string  :face_unit
      t.integer :days_to_redemption
      t.date    :mat_date
      t.date    :coupon_date
      t.integer :coupon_value
      t.integer :coupon_percent
      t.string  :bond_type
      t.string  :type_name

      t.timestamps
    end
  end
end