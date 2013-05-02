require 'spec_helper'

describe FlyingSuperhero do
  it "should respond to #abilities" do
    kent = FlyingSuperhero.new
    raise kent.abilities.inspect
    kent.respond_to?(:abilities).should be_true
   #  :flight => { :speed => "900 kph", :height => "40 miles" },
   #  :super_vision => { :viable_media => ["wood", "stone", "iron"]},
   #  :steely_demeanor => ""
   #}
  end
end
