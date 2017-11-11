# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
User.create!([
	{username: "john", email: "j@j.j", password: "john", password_confirmation: "john", user_class: 'admin'},
	{username: "angelina", email: "a@a.a", password: "angelina", password_confirmation: "angelina", user_class: 'admin'},
	{username: "kai", email: "k@k.k", password: "kai", password_confirmation: "kai", user_class: 'admin'},
	{username: "brendin", email: "b@b.b", password: "brendin", password_confirmation: "brendin", user_class: 'admin'},
	{username: "dat", email: "d@d.d", password: "dat", password_confirmation: "dat", user_class: 'admin'},
	{username: "bobby", email: "l@m.e", password: "prof", password_confirmation: "prof", user_class: 'regular'}
])

Document.destroy_all

# Document.destroy_all
# Document.create!([
# 	{
# 		filename: "thefirst",
# 		description: "some description",
# 		latitude: "49.264603",
# 		longitude: "-123.156184",
# 		attachment: "123456",
# 		user_id: "1"
# 	},{
# 		filename: "firstandhalf",
# 		description: "some half description",
# 		latitude: "49.264603",
# 		longitude: "-123.156184",
# 		attachment: "098765",
# 		user_id: "1"
# 	},{
# 			filename: "thesecond",
# 			description: "some second description",
# 			latitude: "53.264603",
# 			longitude: "-124.156184",
# 			attachment: "234567",
# 			user_id: "1"
# 	},{
# 			filename: "thethird",
# 			description: "some third description",
# 			latitude: "55.264603",
# 			longitude: "-124.9156184",
# 			attachment: "345678",
# 			user_id: "1"
# 	}
# 	])
