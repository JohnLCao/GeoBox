module Chatroom
	module ChatroomsHelper
		  def self.fetchrooms(latlng)
		    Room.all.select{|room| mutualRadius?(latlng, room.latitude, room.longitude)}
		  end

		  def self.mutualRadius?(userCurrentLatlng, room_lat, room_lng)

		    radiusInMeters = 150.0  # meters
		    radiusInDeg = radiusInMeters/111000 # Convert to degrees via dividing by rate of conversion from meter to degree


		    userlat = userCurrentLatlng[:lat].to_f
		    userlng = userCurrentLatlng[:lng].to_f
		    deltaLat = userlat - room_lat.to_f
		    deltaLng = userlng - room_lng.to_f
		    distanceInDeg = (deltaLat * deltaLat + deltaLng * deltaLng) ** 0.5 #pythag hypotenuse
		    return (distanceInDeg < radiusInDeg) #magik , about 150 meters
		  end
	end
end