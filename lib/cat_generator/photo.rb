module CatGenerator
  class Photo
    CAT_PHOTOS_API = 'http://thecatapi.com/api/images/get'

    # returns the next photo url from thecatapi.com
    def self.url
      response = Excon.get(CAT_PHOTOS_API)

      if response.status == 302
        response.headers["location"]
      end
    end

    # downloads the next photo and saves to Desktop
    def self.write_to_desktop
      photo_url = url

      if photo_url
        filename = photo_url.split('/').last
        target = File.expand_path("~/Desktop/#{filename}")

        File.open(target, 'w') do |file|
          file.write(Excon.get(photo_url).body)
        end
      end
    end

    # opens the photo in the default browser
    def self.open_in_browser
      photo_url = url
      `open #{photo_url}` if photo_url
    end
  end
end
