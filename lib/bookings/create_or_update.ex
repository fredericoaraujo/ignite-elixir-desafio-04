defmodule Flightex.Bookings.CreateOrUpdate do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def call(%{
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id
      }) do
    {:ok, booking} = Booking.build(complete_date, local_origin, local_destination, user_id)
    BookingAgent.save(booking)
  end

  def call(%{
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id,
        id: id
      }) do
    {:ok, booking} = Booking.build(complete_date, local_origin, local_destination, user_id, id)
    BookingAgent.save(booking)
  end
end