class HomeController < ApplicationController
  def index
    require 'ruby-holidayapi'
    require 'json'
    key = '5070eaee-9c15-4036-a876-265cb4d17ec8'
    hapi = HolidayAPI::V1.new(key)
    @holidays_output = hapi.holidays({
    'country': 'TR',
    'year': '2020',
    })
#    @holidays_hash = @holidays_output["holidays"]
# =>  @holidays_name = @holidays_hash["name"]
     if @holidays_output.empty?
       @final_output = "Error"
     else
      @final_output = @holidays_output["holidays"][0]["name"]
    end
  end
  

  def about
  end
  def countries
  end
end
