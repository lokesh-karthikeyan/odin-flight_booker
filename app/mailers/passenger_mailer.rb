class PassengerMailer < ApplicationMailer
  def ticket_booked
    @booking_info = params[:booking_info]
    @passenger = params[:passenger]
    @url = booking_url(@booking_info.id)
    mail(to: @passenger.email, subject: "You have booked your ticket")
  end
end
