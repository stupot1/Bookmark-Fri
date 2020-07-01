require './lib/bookmarks.rb'

describe Bookmarks do
  describe "#all" do
    it "should return all bookmarks held in the instance" do
      p subject.class.all
      expect(subject.class.all).to eql(['http://www.reddit.com','http://www.torbrowser.com']) 
    end
  end
end
