defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(), do: %RemoteControlCar{nickname: "none"}

  def new(nickname), do: %RemoteControlCar{nickname: nickname}

  def display_distance(car = %RemoteControlCar{}), do: "#{car.distance_driven_in_meters} meters"

  def display_battery(_ = %RemoteControlCar{battery_percentage: 0}), do: "Battery empty"

  def display_battery(car = %RemoteControlCar{}), do: "Battery at #{car.battery_percentage}%"

  def drive(remote_car) do
    # Please implement the drive/1 function
  end
end
