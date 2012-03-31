class Forvo
  require 'open-uri'
  require 'base64'

  SEARCH_URL = "http://www.forvo.com/word/"
  WGET_PARAMETERS = "--directory-prefix=/tmp"
  DOWNLOAD_LINKS_REGEX = /a.*onclick=\"Play\((.*)\);.*/

  def initialize(query, language)
    @query, @language = query, language
  end

  def self.download(query)
    forvo = Forvo.new query, "/#de"

    download_links = forvo.fetch_download_links
    return "Word '#{query.join(" ")}' not found" unless download_links.any?

    forvo.download download_links.first
  end

  def fetch_download_links
    html = open_query_page
    match_links = html.match DOWNLOAD_LINKS_REGEX

    match_links ? parse_download_links(match_links[1]) : []
  end

  def download(download_link)
    filename = parse_filename download_link
    file_path =  "/tmp/#{filename}"

    Net::HTTP.start("audio.forvo.com") do |http|
      resp = http.get("/mp3/#{download_link}")
      open(file_path, "wb") do |file|
        file.write(resp.body)
      end
    end

    file_path
  end


  private

  def open_query_page
    begin
      open(query_page_url).read
    rescue OpenURI::HTTPError => exception
    end
  end

  def query_page_url
    "#{SEARCH_URL}#{@query.join("%20")}#{@language}"
  end

  def parse_download_links(params)
    encoded_links = params.split(",").collect {|x| x.gsub("'", "")}
    mp3_link = encoded_links[1]
    [::Base64.decode64(mp3_link)]
  end

  def parse_filename(download_link)
    download_link.match /.*\/.*\/(.*)/
    $1
  end
end
