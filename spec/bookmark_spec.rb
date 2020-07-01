require './lib/bookmarks.rb'

describe Bookmarks do
  describe "#all" do
    it "should return all bookmarks held in the instance" do
      expect(subject.class.all).to eql(['http://www.reddit.com','http://www.torbrowser.com']) 
    end
  end
  describe "#add" do
    it "add bookmark to the database" do
      subject.class.add('www.testurl.com')
      expect(subject.class.all).to eql(['http://www.reddit.com','http://www.torbrowser.com', 'www.testurl.com']) 
    end
  end
end
