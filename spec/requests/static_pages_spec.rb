require 'spec_helper'

describe "StaticPages" do
  subject { page }
  describe "Home Page" do
    before { visit root_path }
    it { should have_content('Parami Soft') }
    it { should have_title('Welcome to parami soft | Home') }
    
    describe "for signed-in users" do
          let(:user) { FactoryGirl.create(:user) }
          before do
            FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
            FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
            sign_in user
            visit root_path
    end

          it "should render the user's feed" do
            user.feed.each do |item|
              expect(page).to have_selector("li##{item.id}", text: item.content)
              end
          end
    end
  end
    
  describe "Help page" do
      before { visit help_path }
      it { should have_content('Help') }
      it { should have_title('Welcome to parami soft | Help') }
    end
  
  describe "About Page" do
    before { visit about_path }
    it { should have_content('About us') }
    it { should have_title('Welcome to parami soft | About') }
  end
  
  describe "Contact Page" do
    before { visit contact_path }
    it { should have_content('Contact us') }
    it { should have_title('Welcome to parami soft | Contact') }  
  end

end