# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Cadastrando as categorias..............'
categories = [
              "Animais e acessórios",
              "Esporte",
              "Para sua casa",
              "Eletrônico e celulares",
              "Músicas e hobbies",
              "Bebês e crianças",
              "Moda e beleza",
              "Veículos e barcos",
              "Imóveis",
              "Emprego e negócios"
            ]

categories.each do |category|
  Category.find_or_create_by(description: category)
end
puts 'Categorias cadastradas com sucesso!'


puts 'Cadastrando admin----------'
  Admin.create(name: 'Orfenes',
               email:'rodrigo@admin.com.br',
               password:'123456',
               password_confirmation: '123456',
               role: 0)

  10.times do |i|
    Admin.create(name:Faker::Name.name ,
                 email: Faker::Internet.email,
                 password:'123456',
                 password_confirmation: '123456',
                 role: [0, 1].sample)
  end
puts 'Cadastrado com sucesso!'
