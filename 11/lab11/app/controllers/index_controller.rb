# frozen_string_literal: false

require 'prime'

# Docs
class IndexController < ApplicationController
  def input; end

  def output
    if (result = Twin.find_by_input(@input = params[:inpt]))
      @result = result.decoded_twins
    else
      result = Twin.new(input: @input)
      if result.save
        @result = result.decoded_twins
      else
        redirect_to root_path, notice: result.errors.messages[:input][0]
      end
    end
  end

  def show_db
    # Задание с сериализацией
    # Для отрисовки в views/layouts/application.html.erb добавили <html data-turbo='false'>
    render xml: Twin.all
  end
end
