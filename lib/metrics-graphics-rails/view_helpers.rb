require 'json'

module MetricsGraphicsRails
  module ViewHelpers
    # TODO: generalize for extra options
    def metrics_graphic_for(data, options = {})
      json_data   = data.to_json
      target      = options.fetch(:target)
      x_accessor  = options.fetch(:x_accessor) { :date }
      y_accessor  = options.fetch(:y_accessor) { :value }
      title       = options.fetch(:title)
      description = options.fetch(:description) { '' }
      width       = options.fetch(:width) { 600 }
      height      = options.fetch(:height) { 250 }
      time_format = options.fetch(:time_format) { '%Y-%m-%d' }

      javascript_tag <<-SCRIPT
        var data = #{json_data};

        MG.convert.date(data, 'date', #{time_format});

        MG.data_graphic({
          title: "#{title}",
          description: "#{description}",
          data: data,
          width: #{width},
          height: #{height},
          target: '#{target}',
          x_accessor: '#{x_accessor}',
          y_accessor: '#{y_accessor}'
        });
      SCRIPT
    end
  end
end
