class Analytic < ApplicationRecord
  belongs_to :shortened_link
  geocoded_by :ip,
    :latitude => :lat, :longitude => :lon
  reverse_geocoded_by :lat, :lon
  after_validation :geocode, :reverse_geocode
end
