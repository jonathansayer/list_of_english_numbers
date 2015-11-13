class NumbersController < ApplicationController

  def index
  end

  def generate_list
    number = params[:list_number][:number].to_i
    list = Generate_List.generate number
    session[:list] = list
    session[:per_page] = params[:list_number][:per_page]
    redirect_to numbers_show_path
  end

  def show
    list = session[:list]
    p per_page = session[:per_page]
    list = WillPaginate::Collection.create(2, per_page, list.length)do |pager|
      pager.replace list
    end
    @display_list = list.paginate(page: params[:page], per_page: per_page)
  end

end
