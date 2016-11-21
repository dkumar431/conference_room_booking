class SearchesController < ApplicationController
  def new
    @search = Search.new
  end
  def create 
   
    @search_results = Booking.search(search_params)
    @booking = Booking.new
    @booking.date = search_params[:date]
    @booking.start_time = search_params[:start_time]
    @booking.end_time = search_params[:end_time]
    render 'searches/partials/_search_results'
  end

  private
  def search_params
    params.require(:search).permit(:date, :start_time, :end_time)
  end
end
