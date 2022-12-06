# frozen_string_literal: false

# все сгенерировал rails g scaffold user username:string password_digest:string
# !!!!написать password_!!digest!!, а то не будет работать has_secure_password
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[create new]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        sign_in @user # Если юзер успешно создался, записиываем значение в куки и делаем текущим его пользователем сесии
        format.html { redirect_to root_path, notice: 'Пользователь успешно создан!' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'Пользователь успешно обновлён!' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Пользователь успешно уничтожен!.' }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # поменять :password_digest на :password, так же в views/users/_form.html.erb
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
