namespace :dev do
  desc 'Configura o ambiente de desenvolvimento'
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o banco de dados") do
        %x(rails db:drop)
      end
      show_spinner("Criando o banco de dados") { %x(rails db:create) }
      show_spinner("Migrando as tabelas") { %x(rails db:migrate) }
      %x(rails dev:add_contacts)
    else
      puts 'Você não está em ambiente de desenvolvimento'
    end
  end

  desc 'Cadastra os contatos'
  task add_contacts: :environment do
    show_spinner('Cadastrando os contatos') do
      contacts = [
        {
          name: Faker::Name.name,
          phone: Faker::PhoneNumber.cell_phone
        },
        {
          name: Faker::Name.name,
          phone: Faker::PhoneNumber.cell_phone
        },
        {
          name: Faker::Name.name,
          phone: Faker::PhoneNumber.cell_phone
        }
      ]

      contacts.each do |contact|
        Contact.find_or_create_by!(contact)
      end
    end
  end

  private

  def show_spinner(mensagem)
    spinner = TTY::Spinner.new("[:spinner] #{mensagem}")
    spinner.auto_spin
    yield
    spinner.success("(sucesso!)")
  end
end
