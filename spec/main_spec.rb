require 'spec_helper'

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

describe FlyingSuperhero do
  let(:hero) { FlyingSuperhero.new }
  abilities = {
               :flight => { :speed => "900 kph", :height => "40 miles" },
               :super_vision => { :viable_media => ["wood", "stone", "iron"]}
              }

  context "abilities basics" do
    it "should respond to #abilities" do
      hero.respond_to?(:abilities).should be_true
    end

    it "should have the right abilities" do
      hero.abilities.should eq(abilities)
    end
  end

  context "assigned abilities" do
    it "should respond to #flight" do
      hero.respond_to?(:flight).should be_true
    end

    it "should respond to #super_vision" do
      hero.respond_to?(:super_vision).should be_true
    end

    it "should return the correct hash of attributes" do
      hero.super_vision.should eq({viable_media: ["wood", "stone", "iron"]})
    end
  end
end
