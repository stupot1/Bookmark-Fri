require './lib/bookmarks.rb'

describe Bookmarks do
  xdescribe "#all" do
    it "should return all bookmarks held in the instance" do
      expect(Bookmarks.all.[0].url).to eql('') 
    end
  end
  describe "#add" do
    it "add bookmark to the database" do
      Bookmarks.add('http://www.testurl.com', 'Test')
      expect(Bookmarks.all.last.url).to eql('http://www.testurl.com') 
    end
  end
end
