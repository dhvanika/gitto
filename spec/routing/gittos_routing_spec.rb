require "spec_helper"

describe GittosController do
  describe "routing" do

    it "routes to #index" do
      get("/gittos").should route_to("gittos#index")
    end

    it "routes to #new" do
      get("/gittos/new").should route_to("gittos#new")
    end

    it "routes to #show" do
      get("/gittos/1").should route_to("gittos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/gittos/1/edit").should route_to("gittos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/gittos").should route_to("gittos#create")
    end

    it "routes to #update" do
      put("/gittos/1").should route_to("gittos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/gittos/1").should route_to("gittos#destroy", :id => "1")
    end

  end
end
