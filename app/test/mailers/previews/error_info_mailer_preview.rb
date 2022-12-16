# Preview all emails at http://localhost:3000/rails/mailers/error_info_mailer
class ErrorInfoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/error_info_mailer/catch_error
  def catch_error
    ErrorInfoMailer.catch_error
  end

end