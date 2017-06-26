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
#####################
puts 'Cadastrando o Administrador padrão'

  Admin.create(name: 'Orfenes',
    email:'rodrigo@admin.com.br',
    password:'123456',
    password_confirmation: '123456',
    role: 0)

puts 'Adminstrador padrao cadastrado com sucesso'
####################
puts 'Cadastrando o member padrao'
  member = Member.new(
      email: 'rodrigo@member.com.br',
      password:'123456',
      password_confirmation: '123456')

  member.build_profile_member

  member.profile_member.first_name  = 'rodrigo'
  member.profile_member.second_name = 'orfenes'

  member.save!
puts 'Membro padrao cadastrado com sucesso'

