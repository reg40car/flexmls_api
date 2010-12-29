require './spec/spec_helper'

describe FlexmlsApi::Models::Photo do
  before(:each) do
    @photo = FlexmlsApi::Models::Photo.new({
      "ResourceUri" => "/listings/20100815153524571646000000/photos/20101124153422574618000000",
      "Id"          => "20101124153422574618000000",
      "Name"        => "Photo 1 name",
      "Caption"     => "caption here",
      "UriThumb"    => "http://photos.cdn.flexmls.com/xyz-t.jpg",
      "Uri300"      => "http://photos.cdn.flexmls.com/xyz.jpg",
      "Uri640"      => "http://cdn.resize.flexmls.com/az/640x480/true/20101124153422574618000000-o.jpg",
      "Uri800"      => "http://cdn.resize.flexmls.com/az/800x600/true/20101124153422574618000000-o.jpg",
      "Uri1024"     => "http://cdn.resize.flexmls.com/az/1024x768/true/20101124153422574618000000-o.jpg",
      "Uri1280"     => "http://cdn.resize.flexmls.com/az/1280x1024/true/20101124153422574618000000-o.jpg",
      "UriLarge"    => "http://photos.cdn.flexmls.com/xyz-o.jpg",
      "Primary"     => true
    })

  end


  it "responds to" do
    @photo.should respond_to(:primary?)
    FlexmlsApi::Models::Photo.should respond_to(:find_by_listing_key)
  end

  it "knows if it's the primary photo" do
    @photo.primary?.should be_true
    @photo.Primary = false
    @photo.primary?.should be_false
  end

  it "can find photos by listing id" 


  after(:each) do  
    @photo = nil
  end


end
