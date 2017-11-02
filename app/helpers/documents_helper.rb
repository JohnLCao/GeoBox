module DocumentsHelper
  mockRadius = 0.00001497678
  setRadius = mockRadius

  def fetchfiles(Latlng)
    Document.all.select{|doc| mutualRadius?(Latlng, doc.latitude, doc.longitude)}
  end

  def mutualRadius?(userCurrentLatlng, doc_lat, doc_lng)
    userlat = userCurrentLatlng.split(',')[0].to_i
    userlng = userCurrentLatlng.split(',')[1].to_i
    deltaLat = userlat - doc_lat.to_i
    deltaLng = userlng - doc_lng.to_i
    distanceInDeg = (deltaLat * deltaLat + deltaLng * deltaLng) ** 0.5 #pythag hypotenuse
    return (distanceInDeg < setRadius)
  end

end
