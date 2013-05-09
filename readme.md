writing a small api to set attributes on a class

example
``` ruby
class FlyingSuperhero
  include HeroAttributes
  ability :flight do |f|
    f.speed = "900 kph"
    f.height = "40 miles"
  end
  ability :super_vision do |sv|
    sv.viable_media = ["wood", "stone", "iron"]
  end
end

clark_kent = FlyingSuperhero.new
clark_kent.abilities # => { 
                     #      :flight => { :speed => "900 kph", :height => "40 miles" },
                     #      :super_vision => { :viable_media => ["wood", "stone", "iron"] }
                     #    }
clark_kent.flight # => { :speed => "900 kph", :height => "40 miles" }
clark_kent.super_vision # => { :viable_media => ["wood", "stone", "iron"] }
```
