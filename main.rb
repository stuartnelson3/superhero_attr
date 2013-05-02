# => { :flight => { :speed => "900 kph", :height => "40 miles" },
#      :super_vision => { :viable_media => ["wood", "stone", "iron"},
#      :steely_demeanor => "" }
module HeroAttributes
  def abilities
    @abilities ||= {}
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def ability(ability, &block)
      ability = Ability.new(&block)
      #@abilities.merge ability
    end
  end
end

require 'ostruct'
class Ability < OpenStruct
  def initialize &block
    block.call self
  end
end

class FlyingSuperhero
  include HeroAttributes
  ability :flight do |f|
    f.speed = "900 kph"
    f.height = "40 miles"
  end
  ability :super_vision do |sv|
    sv.viable_media = ["wood", "stone", "iron"]
  end
  ability :steely_demeanor
end
