class HolidaysController < ApplicationController
  
  def index
    @q = Holiday.ransack(params[:q])
    @holidays = @q.result(distinct: true)
    @search = Holiday.search(params[:q])
    respond_to do |format|
      format.xlsx{
        response.headers['Content-Disposition'] = 'attachment; filename=holidays.xlsx'
      }
      format.html{ render :index }
    end
  end

  def create
    @holiday = Holiday.new(holiday_params)

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to @holiday, notice: "Holiday was successfully created." }
        format.json { render :show, status: :created, location: @holiday }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to @holiday, notice: "Holiday was successfully updated." }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @holiday.destroy
    respond_to do |format|
      format.html { redirect_to holidays_url, notice: "Holiday was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def get_holidays
    service = HolidayApiService.new.get_holidays
    redirect_to holidays_path, notice: "Holiday was successfully imported."
  end
  private
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def holiday_params
      params.require(:holiday).permit(:holiday_name, :date, :country)
    end
end
