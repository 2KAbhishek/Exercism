defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(), do: %RemoteControlCar{nickname: "none"}

  def new(nickname), do: %RemoteControlCar{nickname: nickname}

  def display_distance(remote_car = %RemoteControlCar{}), do: "#{remote_car.distance_driven_in_meters} meters"

  def display_battery(remote_car) do
    # Please implement the display_battery/1 function
  end

  def drive(remote_car) do
    # Please implement the drive/1 function
  end
end
