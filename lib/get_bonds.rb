#!/usr/bin/env ruby
require 'httparty'
require 'active_support/core_ext/hash'

response = HTTParty.get('https://iss.moex.com/iss/securitygroups/stock_bonds/collections/stock_bonds_corp_all/securities.xml?limit=100')
hash = response.parsed_response
bonds = hash["document"]["data"][0]["rows"]["row"]

bonds.each do |bond|
  Bond.create(
    name: bond["NAME"],
    shortname: bond["SHORTNAME"],
    isin: bond["ISIN"],
    face_value: bond["FACEVALUE"],
    face_unit: bond["FACEUNIT"],
    days_to_redemption: bond["DAYSTOREDEMPTION"],
    mat_date: bond["MATDATE"],
    coupon_date: bond["COUPONDATE"],
    coupon_value: bond["COUPONVALUE"],
    coupon_percent: bond["COUPONPERCENT"],
    bond_type: bond["TYPE"],
    type_name: bond["TYPENAME"]
  )
end