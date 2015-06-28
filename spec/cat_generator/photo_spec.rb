require 'spec_helper'

describe CatGenerator::Photo do
  let!(:filename) { "tumblr_m2sv7p4ayD1r73wdao1_250.gif" }
  let!(:url) { "http://24.media.tumblr.com/#{filename}" }
  let!(:request) do
    stub_request(:get, CatGenerator::Photo::CAT_PHOTOS_API).to_return(body: "",
                                                                      headers: {"Location" => url, "Content-Type"=>"text/html"},
                                                                      status: 302)
  end

  describe '.url' do
    it 'requests a cat photo from thecatapi' do
      CatGenerator::Photo.url
      expect(request).to have_been_requested
    end

    it 'returns the url of a random cat photo' do
      expect(CatGenerator::Photo.url).to eq url
    end

    it 'returns nil if no photo can be fetched' do
      stub_request(:get, CatGenerator::Photo::CAT_PHOTOS_API).to_return(status: 400)
      expect(CatGenerator::Photo.url).to be_nil
    end
  end

  describe '.write_to_desktop' do
    let(:photo_request) do
      stub_request(:get, url).to_return(body: "this is the content of the photo", status: 200)
    end

    it 'saves the photo to the desktop' do
      desktop_file = double
      file = File.expand_path("~/Desktop/#{filename}")

      expect(File).to receive(:open).with(file, 'w').and_return(desktop_file)
      CatGenerator::Photo.write_to_desktop
    end

    it 'does not save the photo if the photo cant be fetched' do
      stub_request(:get, CatGenerator::Photo::CAT_PHOTOS_API).to_return(status: 400)
      expect(File).to_not receive(:open)
      CatGenerator::Photo.write_to_desktop
    end
  end

  describe '.open_in_browser' do
    it 'opens the photo in a browser window' do
      expect(CatGenerator::Photo).to receive(:`).with("open #{url}")
      CatGenerator::Photo.open_in_browser
    end

    it 'does not open the photo in the browser if photo can not be fetched' do
      allow(CatGenerator::Photo).to receive(:url).and_return(nil)
      expect(CatGenerator::Photo).to_not receive(:`)
      CatGenerator::Photo.open_in_browser
    end
  end
end
