module BooksHelper

  def self.fetchbooks(latlng)
    Book.all.select{|book| mutualRadius?(latlng, book.latitude, book.longitude)}
  end

  def self.mutualRadius?(userCurrentLatlng, book_lat, book_lng)

    radiusInMeters = 150.0  # meters
    radiusInDeg = radiusInMeters/111000 # Convert to degrees via dividing by rate of conversion from meter to degree


    userlat = userCurrentLatlng[:lat].to_f
    userlng = userCurrentLatlng[:lng].to_f
    deltaLat = userlat - book_lat.to_f
    deltaLng = userlng - book_lng.to_f
    distanceInDeg = (deltaLat * deltaLat + deltaLng * deltaLng) ** 0.5 #pythag hypotenuse
    return (distanceInDeg < radiusInDeg) #magik , about 150 meters
  end

end
