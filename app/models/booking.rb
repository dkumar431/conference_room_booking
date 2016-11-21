# == Schema Information
#
# Table name: bookings
#
#  id                 :integer          not null, primary key
#  conference_room_id :integer
#  user_id            :integer
#  start_time         :datetime
#  end_time           :datetime
#  booking_status_id  :integer
#  priority           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Booking < ActiveRecord::Base
  belongs_to :conference_room
  belongs_to :user
  belongs_to :booking_status


  attr_accessor :date

  def self.search(search_filters)
    return [] if is_holiday?(search_filters[:date])
    start_time = format_datetime(search_filters[:date],search_filters[:start_time])
    end_time = format_datetime(search_filters[:date],search_filters[:end_time])
    new_start_time = add_minute(start_time)
    search_sql = "SELECT CR.*,B.BC NO_OF_BOOKINGS
                  FROM
                    CONFERENCE_ROOMS CR
                    LEFT JOIN (SELECT CONFERENCE_ROOM_ID, COUNT(ID) BC 
                      FROM BOOKINGS 
                        WHERE 
                          (START_TIME  BETWEEN $1 AND $2 OR END_TIME  BETWEEN $3 AND $4)
                          AND BOOKING_STATUS_ID NOT IN (2,4)
                          GROUP BY CONFERENCE_ROOM_ID) B
                    ON CR.ID = B.CONFERENCE_ROOM_ID
                  ORDER BY id"
    connection = ActiveRecord::Base.connection.raw_connection
    
    connection.exec_params(search_sql, [new_start_time.utc,end_time.utc,new_start_time.utc,end_time.utc])   
    
               
  end

  def self.create_booking(booking_params)
     booking = Booking.new(param_list(booking_params))
     booking.set_status_and_priority
     booking.save
  end

  def set_status_and_priority
    bookings = Booking.where(
      "conference_room_id = ? and 
      booking_status_id in (?) and 
      (start_time between ? and ? or end_time  between ? and ?)",
      conference_room_id, [1,3], start_time, end_time, start_time, end_time)
    if bookings.count == 0
      self.assign_attributes(booking_status_id: 1, priority: 1)
    else
      self.assign_attributes(booking_status_id: 3, priority: bookings.count + 1)
    end
  end

  def cancel_booking
    start_time = self.start_time
    end_time = self.end_time
    self.update_attributes({booking_status_id: 2})
    Booking.confirm_waiting_bookings(start_time, end_time)
  end

  def self.confirm_waiting_bookings(start_time, end_time)
    waiting_bookings = Booking
      .where("booking_status_id = 3 and (START_TIME BETWEEN ? AND ? OR END_TIME BETWEEN ?  AND ?)",start_time,end_time,start_time,end_time).order("priority,created_at")
    waiting_bookings.each do |meeting|
      stime = meeting.start_time
      etime = meeting.end_time
      confirmed_bookings = Booking.where("booking_status_id = 1 and (START_TIME BETWEEN ? AND ? OR END_TIME BETWEEN ?  AND ?)",stime,etime,stime,etime)
      if confirmed_bookings.count == 0
        meeting.update_attributes({booking_status_id: 1})
      end
    end
  end

  def self.is_holiday?(date)
    return true if is_weekend? date
    holiday_cnt = Holiday.where(date: date).count
    return true if holiday_cnt == 1
  end

  def self.is_weekend?(date)
    dt = Date.parse(date)
    dt.saturday? || dt.sunday? ? true : false
  end

  def self.add_minute(time)
    new_time = time + 1*60
  end

  def self.get_my_bookings
    Booking
      .select("bookings.id,bookings.start_time,bookings.end_time,conference_rooms.name,booking_statuses.status,bookings.booking_status_id")
      .joins(:booking_status,:conference_room)
  end

  private
  def self.format_datetime(date, time)
    Time.parse("#{date} #{time}")
  end

  def self.param_list(params)
    {
      conference_room_id: params[:conference_room_id],
      user_id: params[:user_id],
      start_time: add_minute(format_datetime(params[:date], params[:start_time])),
      end_time: format_datetime(params[:date], params[:end_time]),
    }
  end

end
