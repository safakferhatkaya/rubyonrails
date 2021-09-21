class HomeController < ApplicationController
  def index
  end
  def about
  end
  def countries
    I18nData.countries.flatten
    @country_and_names_print = I18nData.countries.flatten
    @handle_comma_country = (@country_and_names_print).select {|i| (i).length < 3}

  end
end
