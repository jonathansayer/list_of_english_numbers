module NumbersHelper

  def per_page_value value
    if value != ''
      session[:per_page] = value
    else
      session[:per_page] = 5
    end
  end
  
end
