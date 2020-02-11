require 'nokogiri'
require 'open-uri'

module ProductScraper
  include Nokogiri
  include OpenURI

  class Scraper
    USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36"
    attr_accessor :url

    def initialize(url = "")
      @url = url
      @doc = nil
    end

    private
      def html_scrape_for(prices)
        if prices.first.nil?
          return 0.0
        else
          # Applies a regular expression for a price format dd.dd and converts it to a decimal
          price_text = prices.first.text
          return price_text.delete(' ')[/\d+(\.)*\d+/].to_d
        end
      end

      def create_doc()
        begin
          html = open(@url, "User-Agent" => USER_AGENT)
        rescue OpenURI::HTTPError => error
          response = error.io
          return response
        end
        @doc = Nokogiri::HTML(html)
      end
  end
end
