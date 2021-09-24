class HolidayApiService
  def get_holidays
    @country_and_names = I18nData.countries.flatten
    key = '6385f310-2f29-4b7e-98a6-e6ff63a64619'
    i=2
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
          @db = Holiday. ({"holiday_name" => "#{@final_output_holiday_name}", 
          "date" => "#{@final_output_holiday_date}", 
          "country" => "#{@final_output_holiday_country}"})
          @db.save
          k+=1   
        end#little while's end
      end#if's end
    end#big while's end
  end#func end
end