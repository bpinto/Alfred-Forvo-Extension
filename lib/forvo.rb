class Forvo
  require 'open-uri'
  require 'base64'

  SEARCH_URL = "http://www.forvo.com/word/"
  WGET_PARAMETERS = "--directory-prefix=/tmp"

  def self.download(query)
    language = "/#de"

    html = open(download_url(query, language)).read
    download_path = parse_download_path(html)
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

  def self.download_url(query, language)
    "#{SEARCH_URL}#{query.join("%20")}#{language}"
  end

  def self.parse_download_path(html)
    html.match /a.*onclick=\"Play\((.*)\);.*/
    parameters = $1.split(",").collect{|x| x.gsub("'", "")}
    ::Base64.decode64(parameters[1])
  end

  def self.parse_filename(download_path)
    download_path.match /.*\/.*\/(.*)/
    $1
  end
end
