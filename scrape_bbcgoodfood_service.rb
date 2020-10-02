
require "open-uri"
require "nokogiri"
require_relative "recipe"

class ScrapeBBCGoodFoodService
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    html = open("https://www.bbcgoodfood.com/search/recipes?query=#{@ingredient}").read
    # 1. Parse HTML
    doc = Nokogiri::HTML(html, nil, "utf-8")
    # 2. For the first five results
    results = []
    doc.search(".node-teaser-item").first(5).each do |element|
      # 3. Create recipe and store it in results
      name = element.search('.teaser-item__title a').text.strip
      description = element.search('.field-item').text.strip
      prep_time = element.search('.teaser-item__info-item--total-time').text.strip
      results << Recipe.new(name: name, description: description, prep_time: prep_time)
    end
    return results
  end
end
