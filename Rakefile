require 'carmen'
require 'json'

namespace :country_region_selector_rails do
  desc "Generate country-region data from Carmen sources"
  task :generate_data do
    data = Carmen::Country.all.map do |country|
      regions = country.subregions.map do |region|
        [region.name, region.code]
      end.sort_by { |e| e[0] }

      [country.name, country.code, regions]
    end.sort_by { |e| e[0] }

    puts data

    #puts JSON.generate(:data => data)
  end
end
