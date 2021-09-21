class Holiday < ApplicationRecord
 #   validates: holiday_name,  uniqueness: true

    require 'ruby-holidayapi'
    require 'json'
    require 'i18n_data'
    I18nData.countries.flatten
    @country_and_names = I18nData.countries.flatten
    #o.txt buraya
    i=2
    k=0
    key = '5070eaee-9c15-4036-a876-265cb4d17ec8'
    while i<(@country_and_names).length
        hapi = HolidayAPI::V1.new(key)
        
        @holidays_output = hapi.holidays({
       'country': "#{@country_and_names[i]}",
       'year': '2020',
        })
        i+=2
        if @holidays_output["status"]!=200
            @final_output_holiday_name = "Error"
        else
        k=0
        while k<(@holidays_output["holidays"]).size
           @final_output_holiday_name = @holidays_output["holidays"][k]["name"]
           @final_output_holiday_date = @holidays_output["holidays"][k]["date"]
           @final_output_holiday_country = @holidays_output["holidays"][k]["country"]
           @test_ = Holiday.new({ "holiday_name" => "#{@final_output_holiday_name}", 
          "date" => "#{@final_output_holiday_date}", 
          "country" => "#{@final_output_holiday_country}"})
           @test_.save
           k+=1
            
            end#little while's end
        end
    end#big while's end
end#class's end
