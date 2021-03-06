class Analytic < ApplicationRecord
  belongs_to :shortened_link
  geocoded_by :ip,
    latitude: :lat, 
    longitude: :lon
  reverse_geocoded_by :lat, :lon do |obj,results|
    if geo = results.first
      obj.city    = geo.city
      obj.country = geo.country_code
    end
  end
  after_validation :geocode, :reverse_geocode
end
