module HeroAttributes
  def self.included(base)
    base.extend(ClassMethods)
  end

  def abilities
    self.class.abilities
  end

  module ClassMethods
    def ability(ability_name)
      raise Errors::NoAttributesGiven, "Must specify attributes for ability" unless block_given?
      ability = Ability.new
      yield ability
      abilities.merge!({ ability_name => ability.to_h })
      define_method(ability_name) { abilities[ability_name] }
    end

    def abilities
      @abilities ||= {}
    end
  end
end

class Errors
  class NoAttributesGiven < StandardError;end
end

require 'ostruct'
class Ability < OpenStruct;end
