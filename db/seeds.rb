# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
User.create!([
	{username: "jon", email: "know@nothing.ca", password: "snow", password_confirmation: "snow"}
])

Document.destroy_all
Document.create!([
	{
		filename: "thefirst",
		description: "some description",
		latitude: "49.264603",
		longitude: "-123.156184",
		cloudKey: "123456",
	}
	])

	Document.create!([
		{
			filename: "thesecond",
			description: "some description",
			latitude: "49.264603",
			longitude: "-123.156184",
			cloudKey: "234567",
		}
		])
