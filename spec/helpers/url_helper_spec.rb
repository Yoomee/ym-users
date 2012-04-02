require 'spec_helper'

describe YmUsers::UrlHelper do
  
  describe "link_if_can" do
    
    it "returns '' if cannot do action" do
      helper.stub(:can? => false)
      helper.link_if_can("New user", [:new, User]).should == ''
    end

    it "returns link_to action if can do new action" do
      helper.stub(:can? => true)
      helper.link_if_can("New user", [:new, User]).should == link_to("New user", new_user_path)      
    end
    
    it "returns link_to action if can do show action" do
      helper.stub(:can? => true)
      user = FactoryGirl.create(:user)
      helper.link_if_can("Show user", user).should == link_to("Show user", user)
    end
    
    it "returns link_to action if can do edit action" do
      helper.stub(:can? => true)
      user = FactoryGirl.create(:user)
      helper.link_if_can("Edit user", [:edit, user]).should == link_to("Edit user", edit_user_path(user))
    end
    
    it "returns link_to action if can do destroy action" do
      helper.stub(:can? => true)
      user = FactoryGirl.create(:user)
      helper.link_if_can("Delete user", [:destroy, user]).should == link_to("Delete user", user, :method => :delete)
    end
    
  end
  
end