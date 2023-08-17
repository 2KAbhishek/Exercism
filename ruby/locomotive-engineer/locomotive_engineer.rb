# frozen_string_literal: true

class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons) = wagons

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, third, *rest = each_wagons_id
    [third, *missing_wagons, *rest, first, second]
  end

  def self.add_missing_stops(routing_hash, **missing_stops)
    { **routing_hash, stops: missing_stops.sort.to_h.values }
  end

  def self.extend_route_information(route, more_route_information)
    { **route, **more_route_information }
  end
end
