class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  def send_error_info
    erro_info = params.merge(client_ip: request.remote_ip,
                             at: DateTime.now)

    ErrorInfoMailer.with(error_info: erro_info).catch_error.deliver_now!

    redirect_to root_path
  end

  private
    def require_logged_in_user
      unless user_signed_in?
        flash[:danger] = 'Para acessar faça login!'
        redirect_to entrar_path
      end
    end
end
