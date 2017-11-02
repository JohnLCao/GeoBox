module DocumentsHelper
  mockRadius = 0.00001497678
  setRadius = mockRadius

  def fetchfiles(Latlng)
    Document.all.select{|doc| mutualRadius?(Latlng, doc.latitude, doc.longitude)}
  end

  def mutualRadius?(userCurrentLatlng, doc_lat, doc_lng)
    lat = userCurrentLatlng.split(',')[0].to_i
    lng = userCurrentLatlng.split(',')[1].to_i
    deltaLat = lat - doc_lat.to_i
    deltaLng = lng - doc_lng.to_i
    distanceInDeg = (deltaLat * deltaLat + deltaLng * deltaLng) ** 0.5 #pythag hypotenuse
    return (distanceInDeg < setRadius)
  end

end
