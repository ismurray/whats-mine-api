require "rails_helper"

RSpec.describe UsersBoxesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/users_boxes").to route_to("users_boxes#index")
    end


    it "routes to #show" do
      expect(:get => "/users_boxes/1").to route_to("users_boxes#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/users_boxes").to route_to("users_boxes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/users_boxes/1").to route_to("users_boxes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/users_boxes/1").to route_to("users_boxes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/users_boxes/1").to route_to("users_boxes#destroy", :id => "1")
    end

  end
end
