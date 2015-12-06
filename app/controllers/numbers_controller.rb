class NumbersController < ApplicationController
  include NumbersHelper

  def index
    Number.delete_all
  end

  def generate_list
    number = params[:list_number][:number].to_i
    Generate_List.generate number
    per_page_value params[:list_number][:per_page]
    redirect_to numbers_show_path
  end

  def show
    list = Number.all
    per_page = session[:per_page]
    list = WillPaginate::Collection.create(2, per_page, list.length)do |pager|
      pager.replace list
    end
    @display_list = list.paginate(page: params[:page], per_page: per_page)
  end

end
