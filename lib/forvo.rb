class Forvo
  require 'nokogiri'
  require 'open-uri'

  SEARCH_URL = "http://www.forvo.com/word/"
  WGET_PARAMETERS = "--directory-prefix=/tmp"

  def self.download(query, language = "/#de")
    doc = Nokogiri::HTML(open("#{SEARCH_URL}#{query}#{language}"))
    download_path = parse_download_path(doc)
    filename = parse_filename(download_path)
    file_path = "/tmp/#{filename}"

    Net::HTTP.start("audio.forvo.com") do |http|
      resp = http.get("/mp3/#{download_path}")
      open(file_path, "wb") do |file|
        file.write(resp.body)
      end
    end

    file_path
  end

  private

  def self.parse_download_path(page)
    #encoded_path = page.xpath("//a[starts-with(@onclick, 'Play')]").first.attribute('onclick').value
    #encoded_path.match /.*'(.*)',.*/
    #::Base64.decode64($1)
    "8979374/34/8979374_34_20952_1.mp3"
  end

  def self.parse_filename(download_path)
    download_path.match /.*\/.*\/(.*)/
    $1
  end
end
