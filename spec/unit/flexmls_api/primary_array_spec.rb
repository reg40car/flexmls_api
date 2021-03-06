require './spec/spec_helper'

class PrimaryModel
  include FlexmlsApi::Primary
  attr_accessor :Primary, :id, :attributes
  def initialize(id, prime = false)
    @id = id
    @Primary = prime
    @attributes = {"Primary" => prime }
  end
end

describe FlexmlsApi::PrimaryArray do
  it "should give me the primary element" do
    a = PrimaryModel.new(1)
    b = PrimaryModel.new(2)
    c = PrimaryModel.new(3)
    d = PrimaryModel.new(4, true)
    e = PrimaryModel.new(5)
    tester = subject.class.new([d,e])
    tester.primary.should eq(d)
    tester = subject.class.new([a,b,c,d,e])
    tester.primary.should eq(d)
    # Note, it doesn't care if there is more than one primary, just returns first in the list.
    b.Primary = true
    tester.primary.should eq(b)
  end
  it "should return nil when there is no primary element" do
    a = PrimaryModel.new(1)
    b = PrimaryModel.new(2)
    c = PrimaryModel.new(3)
    d = PrimaryModel.new(4)
    e = PrimaryModel.new(5)
    tester = subject.class.new([])
    tester.primary.should be(nil)
    tester = subject.class.new([a,b,c,d,e])
    tester.primary.should be(nil)
  end
end


