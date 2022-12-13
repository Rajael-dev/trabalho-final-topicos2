namespace :popula do
  desc 'Cria os usuários e cadastra contatos'
  task iniciar: :environment do
    admin = User.new
    admin.name = 'Rafael'
    admin.email = 'rafael@hotmail.com'
    admin.password_digest = '123456'
    admin.is_admin = 1
    admin.save
  end
end
