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
# =>  @holidays_name = @holidays_hash["name"]s

     if @holidays_output.empty?
        @final_output_holiday_name = "Error"
     else
      if(record_flag!=1)
        i=0
        while i<25
           @final_output_holiday_name = @holidays_output["holidays"][i]["name"]
           @final_output_holiday_date = @holidays_output["holidays"][i]["date"]
           @final_output_holiday_country = @holidays_output["holidays"][i]["country"]
           @test_ = Holiday.new({ "holiday_name" => "#{@final_output_holiday_name}", 
          "date" => "#{@final_output_holiday_date}", 
          "country" => "#{@final_output_holiday_country}"})
           @test_.save
           i+=1
        end#while's end
        
      end
     end#if's end
  end
  def about
  end
  def countries
  end
end
