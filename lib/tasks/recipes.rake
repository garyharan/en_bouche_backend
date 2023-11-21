require 'open-uri'

namespace :recipes do
  desc "Saves recipes to a json file that will be hosted by github pages"
  task cache: :environment do
    File.open("cache/recipes.json", "w") do |f|
      f.write URI.open("http://localhost:3000/recipes.json").read
    end
  end
end
