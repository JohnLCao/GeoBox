module DocumentsHelper
  mockRadius = 0.00001497678
  setRadius = mockRadius

  def fetchfiles(latlng)
    Document.all.select{|doc| mutualRadius?(latlng, doc.latitude, doc.longitude)}
  end

  def mutualRadius?(userCurrentLatlng, doc_lat, doc_lng)
    userlat = userCurrentLatlng[:lat].to_f
    userlng = userCurrentLatlng[:lng].to_f
    deltaLat = userlat - doc_lat.to_f
    deltaLng = userlng - doc_lng.to_f
    distanceInDeg = (deltaLat * deltaLat + deltaLng * deltaLng) ** 0.5 #pythag hypotenuse
    return (distanceInDeg < setRadius)
  end

end
