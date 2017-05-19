namespace :dev do

  desc 'Cria membros fake'
  task generate_admins: :environment do
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
  end

  desc 'Criar anuncios fake'
  task generate_ads: :environment do
    puts 'Cadastrando anuncios----'

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description: LeroleroGenerator.paragraph(Random.rand(3)),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new( Rails.root.join('public', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r' )
      )
    end
    puts "ANÚNCIOS cadastrados com sucesso!"
  end


end
