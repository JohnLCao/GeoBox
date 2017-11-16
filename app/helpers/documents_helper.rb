module DocumentsHelper
  # mockRadius = 0.00001497678
  # setRadius = mockRadius


  def self.fetchfiles(latlng)
    Document.all.select{|doc| mutualRadius?(latlng, doc.latitude, doc.longitude)}
  end

  def self.mutualRadius?(userCurrentLatlng, doc_lat, doc_lng)

    radiusInMeters = 150  # meters
    radiusInDeg = radiusInMeters/111000 # Convert to degrees via dividing by rate of conversion from meter to degree


    userlat = userCurrentLatlng[:lat].to_f
    userlng = userCurrentLatlng[:lng].to_f
    deltaLat = userlat - doc_lat.to_f
    deltaLng = userlng - doc_lng.to_f
    distanceInDeg = (deltaLat * deltaLat + deltaLng * deltaLng) ** 0.5 #pythag hypotenuse
    return (distanceInDeg < radiusInDeg) #magik , about 150 meters
  end

end
