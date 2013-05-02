# => { :flight => { :speed => "900 kph", :height => "40 miles" },
#      :super_vision => { :viable_media => ["wood", "stone", "iron"},
#      :steely_demeanor => "" }
module HeroAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  def abilities
    self.class.abilities
  end

  module ClassMethods
    def ability(ability_name, &block)
      raise Errors::NoAttributesGiven, "Must specify attributes for ability" if block.nil?
      ability = Ability.new
      block.call ability
      abilities.merge!({ ability_name => ability.to_h })
    end

    def abilities
      @abilities ||= {}
    end
  end
end

class Errors
  class NoAttributesGiven < StandardError; end
end

require 'ostruct'
class Ability < OpenStruct;end

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
