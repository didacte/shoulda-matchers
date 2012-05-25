require 'spec_helper'


describe Shoulda::Matchers::ActiveModel::BlankValue do
  let(:matcher_class) { Shoulda::Matchers::ActiveModel::BlankValue }

  it "returns an array for collections" do
    model = define_model :parent do
      has_many :children
    end.new
    matcher_class.new(model, :children).value.should == []
  end

  it "returns nil for non collections" do
    model = define_active_model_class("Example", :accessors => [:attr]).new
    matcher_class.new(model, :attr).value.should be nil
  end
end
