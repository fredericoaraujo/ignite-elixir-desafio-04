defmodule Flightex do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.CreateOrUpdate, as: BookingCreateOrUpdate
  alias Flightex.Users.Agent, as: UserAgent
  alias Flightex.Users.CreateOrUpdate, as: UserCreateOrUpdate

  def start_agents() do
    BookingAgent.start_link(%{})
    UserAgent.start_link(%{})
  end

  def create_or_update_booking(%{} = booking) do
    BookingCreateOrUpdate.call(booking)
  end

  def create_or_update_user(%{} = user) do
    UserCreateOrUpdate.call(user)
  end
end
