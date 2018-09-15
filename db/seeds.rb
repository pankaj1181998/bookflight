# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


c[:airports].select {
    |x|
    #a << [ x[:city_name] ,x[:airport_name] , x[:IATA_code] ]
   	IataCode.create( city: x[:city_name] , airport: x[:airport_name] , code: x[:IATA_code] )
  }
 
