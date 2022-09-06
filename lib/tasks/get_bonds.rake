require 'httparty'
require 'active_support/core_ext/hash'

desc 'Download bonds from moex'
task download_bonds: :environment do
  bonds = get_bonds_list('stock_bonds_all')

  bonds.each do |xml_bond|
    next unless xml_bond['ISIN'].present? && xml_bond['MATDATE'].present? && xml_bond['MATDATE'].to_date > Date.current

    bond = Bond.find_by(isin: xml_bond['ISIN'])

    Bond.create(bond_json(xml_bond)) if bond.nil?
  end
end

def get_hash_by_request(url)
  response = HTTParty.get(url)
  response.parsed_response
end

def get_bonds_count(url)
  hash = get_hash_by_request(url)
  hash['document']['data'][1]['rows']['row']['TOTAL']
end

def get_bonds_list(bonds_type)
  bonds = []
  bonds_conut = get_bonds_count("https://iss.moex.com/iss/securitygroups/stock_bonds/collections/#{bonds_type}/securities.xml").to_i
  x = 0

  while x < bonds_conut
    hash = get_hash_by_request("https://iss.moex.com/iss/securitygroups/stock_bonds/collections/#{bonds_type}/securities.xml?limit=100&start=#{x}")
    bonds += hash['document']['data'][0]['rows']['row']
    x += 100
  end

  bonds
end

def bond_json(xml_bond)
  {
    name: xml_bond['NAME'],
    shortname: xml_bond['SHORTNAME'],
    isin: xml_bond['ISIN'],
    face_value: xml_bond['FACEVALUE'],
    face_unit: xml_bond['FACEUNIT'],
    days_to_redemption: xml_bond['DAYSTOREDEMPTION'],
    mat_date: xml_bond['MATDATE'],
    coupon_date: xml_bond['COUPONDATE'],
    coupon_value: xml_bond['COUPONVALUE'],
    coupon_percent: xml_bond['COUPONPERCENT'],
    bond_type: xml_bond['TYPE'],
    type_name: xml_bond['TYPENAME']
  }
end
