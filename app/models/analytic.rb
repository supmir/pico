class Analytic < ApplicationRecord
  belongs_to :shortened_link
  geocoded_by :ip,
    :latitude => :lat, :longitude => :lon
  after_validation :geocode
end
