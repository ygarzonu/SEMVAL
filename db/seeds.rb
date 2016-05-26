# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Logind.create(meta: 95, estado: 85, mes: 1, peorE: 0, fechaM: DateTime.strptime('01/30/2016 17:00, %m/%d/%Y %H:%M'), fechaC: DateTime.strptime("01/30/2016 17:00", "%m/%d/%Y %H:%M"), indicador_id: 1)
Logind.create(meta: 95, estado: 87, mes: 2, peorE: 0, fechaM: DateTime.strptime("02/28/2016 17:00, %m/%d/%Y %H:%M"), fechaC: DateTime.strptime("02/28/2016 17:00", "%m/%d/%Y %H:%M"), indicador_id: 1)
Logind.create(meta: 95, estado: 89, mes: 3, peorE: 0, fechaM: DateTime.strptime("03/30/2016 17:00", "%m/%d/%Y %H:%M"), fechaC: DateTime.strptime("03/30/2016 17:00", "%m/%d/%Y %H:%M"), indicador_id: 1)