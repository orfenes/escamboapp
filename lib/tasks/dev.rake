namespace :dev do

  desc 'Setup Developement'
  task setup_dev: :environment do
    images_path = Rails.root.join('public', 'system')
    puts 'Execuntando o setup para desenvolvimento----------'
    puts "Apagando banco de dados #{%x(rake db:drop)}"
    puts "Apagando imagens de public/system #{%x(rm -rf #{images_path} )}"
    puts "Criando banco de dados #{%x(rake db:create)}"
    puts "Cirando estrutura de tabelas banco de dados  #{%x(rake db:migrate)}"
    puts %x(rake db:seed)
    puts %x(rake dev:generate_admins)
    puts %x(rake dev:generate_members)
    puts %x(rake dev:generate_ads)
    puts %x(rake dev:generate_comments)
    puts 'Setup completado com sucesso!'
  end

  desc 'Cria adminstradores fake'
  task generate_admins: :environment do
    puts 'Cadastrando admin----------'

    10.times do |i|
      Admin.create(name:Faker::Name.name ,
        email: Faker::Internet.email,
        password:'123456',
        password_confirmation: '123456',
        role: [0, 1].sample)
    end
    puts 'Administradores cadastrado com sucesso!'
  end

  desc 'Cria membros fake'
  task generate_members: :environment do
    puts 'Cadastrando de membros----------'

    100.times do |i|
      member = Member.new(
        email: Faker::Internet.email,
        password:'123456',
        password_confirmation: '123456')
      member.build_profile_member

      member.profile_member.first_name  = Faker::Name.first_name
      member.profile_member.second_name = Faker::Name.last_name

      member.save!
    end
    puts 'Membros cadastrado com sucesso!'
  end

  desc 'Criar anuncios fake'
  task generate_ads: :environment do
    puts 'Cadastrando anuncios----'

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description_md: LeroleroGenerator.paragraph([1,2,3].sample),
        description_short: LeroleroGenerator.paragraph([1,2].sample),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r' )
      )
    end

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2,3,4,5].sample),
        description_md: LeroleroGenerator.paragraph([1,2,3].sample),
        description_short: LeroleroGenerator.paragraph([1,2].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r' )
      )
    end
    puts "ANÚNCIOS cadastrados com sucesso!"
  end

  desc 'Cria comentarios fake'
  task generate_comments: :environment do
    puts 'Criando comentarios----------'

    Ad.all.each do |ad|
      (Random.rand(3)).times do
        Comment.create!(
          body: Faker::Lorem.paragraph([1,2,3].sample),
          member: Member.all.sample,
          ad: ad
        )
      end
    end
    puts 'Comentarios criados com sucesso ---------'
  end

end
