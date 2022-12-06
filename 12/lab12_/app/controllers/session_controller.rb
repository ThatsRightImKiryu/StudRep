# frozen_string_literal: false

# Контроллер сессии - время между "пользователь вошел" и "вышел"
class SessionController < ApplicationController
  skip_before_action :require_login, only: %i[login create]
  # перекус учителя чекни application_controller.rb
  # Так как все контроллеры наследуются от ApplicationController,
  # то перед каждым вызываем проверку на аутентификация,
  # здесь кроме метода логина, а то будет бексонечный редирект
  # и созданию пользователей, все могут создавать их

  def login; end
  # Только отрисовка формы

  def create
    user = User.find_by_username(params[:username])
    if user&.authenticate(params[:password])
      # authenticate - метод,который сверяет зашифрованный пароль в базе с данным
      # доступен из-за has_secure_password в model/user.rb
      # В gemfile подключить bcrypt
      # user&.auth.. <=> !user.nil? && user.auth...
      # А то скажет no usch method authenticate for nil class
      sign_in user # Наш метод входа, описанный в хелпере
      redirect_to root_url
    else
      if user.nil?
        flash[:notice] = 'Неправильный логин'
      else
        flash[:notice] = 'Неправильный пароль'
      end
      p flash[:notice]
      redirect_to session_login_url
    end
  end

  def logout
    sign_out # Наш метод выхода, описанный в хелпере
    redirect_to session_login_url
  end
end
