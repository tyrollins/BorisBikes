Boris Bikes [![Code Climate](https://codeclimate.com/github/stoked/BorisBikes/badges/gpa.svg)](https://codeclimate.com/github/stoked/BorisBikes)
---
For this project we were tasked with replicating the functionality of London's famous Boris Bikes initiative. The goal was to introduce students to Object-Oriented-Programming & Design while using Test-Driven-Development with RSpec. In this Boris Bikes project users are able to rent and dock ````bikes```` with the ````docking station````. A ````bike```` can break, in which case it is picked up by the ````van```` and transfered to the ````garage````for repair. Once the repair is complete the ````bike```` is collected and dropped back at the ````docking station````.

### Technologies
* Ruby
* Test-Driven-Development with RSpec
* Git Version Control
* Object-Oriented-Programming
* Object-Oriented-Design
* CRC (class-responsibility-collaboration) cards

### Example
To use the application run `irb`:

```ruby
require "./lib/bike"
=> true
require "./lib/docking_station"
=> true
require "./lib/van"
=> true
require "./lib/garage"
=> true
```

Docking bikes at a station:

```ruby
bike = Bike.new
 => #<Bike:0x000001022e0330 @broken=false>
station = DockingStation.new
 => #<DockingStation:0x000001022e8738 @capacity=10>
 station.dock(bike)
 => [#<Bike:0x000001022e0330 @broken=false>]
station.dock(broken_bike)
 => [#<Bike:0x000001022e0330 @broken=false>, #<Bike:0x00000102308e70 @broken=true>]
station.available_bikes
 => [#<Bike:0x000001022e0330 @broken=false>]
 ```

Transfer a broken bike to the van and take it to the garage for repair:

```ruby
van = Van.new
 => #<Van:0x00000102328130 @capacity=10>
station.release_broken(van)
 => [#<Bike:0x00000102308e70 @broken=true>]
garage = Garage.new
 => #<Garage:0x00000102339070 @capacity=10>
garage.accept_broken(van)
 => [#<Bike:0x00000102308e70 @broken=false>]
garage.bikes.count
=> 1
```

Collect fixed bike from garage and deliver it to the docking station:

```ruby
garage.release_fixed(van)
 => [#<Bike:0x00000102308e70 @broken=false>]
station.accept_fixed(van)
[#<Bike:0x000001022e0330 @broken=false>, #<Bike:0x00000102308e70 @broken=false>]
```

### To Do
* Add Users
* Refactor
