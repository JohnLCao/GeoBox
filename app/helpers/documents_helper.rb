module DocumentsHelper
  # mockRadius = 0.00001497678
  # setRadius = mockRadius


  def self.fetchfiles(latlng)
    Document.all.select{|doc| mutualRadius?(latlng, doc.latitude, doc.longitude)}
  end

  def self.mutualRadius?(userCurrentLatlng, doc_lat, doc_lng)
    userlat = userCurrentLatlng[:lat].to_f
    userlng = userCurrentLatlng[:lng].to_f
    deltaLat = userlat - doc_lat.to_f
    deltaLng = userlng - doc_lng.to_f
    distanceInDeg = (deltaLat * deltaLat + deltaLng * deltaLng) ** 0.5 #pythag hypotenuse
    return (distanceInDeg < 0.001497678) #magik , about 166 meters
  end

end
