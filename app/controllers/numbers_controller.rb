class NumbersController < ApplicationController

  def index
  end

  def generate_list
    p params[:list_number]
    number = params[:list_number][:number].to_i
    list = Generate_List.generate number
    session[:list] = list
    redirect_to numbers_show_path
  end

  def show
    @list = session[:list]
  end

end
