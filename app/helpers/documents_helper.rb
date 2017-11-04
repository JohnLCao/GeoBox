module DocumentsHelper
  # mockRadius = 0.00001497678
  # setRadius = mockRadius


  def self.fetchfiles(latlng)
    ds = Document.all.select{|doc| mutualRadius?(latlng, doc.latitude, doc.longitude)}
    puts "docs fetched: " + ds.to_s
    return ds
  end

  def self.mutualRadius?(userCurrentLatlng, doc_lat, doc_lng)
    puts "Something here."
    puts userCurrentLatlng[:lat].to_s
    userlat = userCurrentLatlng[:lat].to_f
    userlng = userCurrentLatlng[:lng].to_f
    deltaLat = userlat - doc_lat.to_f
    deltaLng = userlng - doc_lng.to_f
    distanceInDeg = (deltaLat * deltaLat + deltaLng * deltaLng) ** 0.5 #pythag hypotenuse
    return (distanceInDeg < 0.0001497678) #magik
  end

end
