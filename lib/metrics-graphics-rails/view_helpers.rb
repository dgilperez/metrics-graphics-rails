require 'json'

module MetricsGraphicsRails
  module ViewHelpers
    # TODO: generalize for extra options
    def metrics_graphic_for(data, options = {})
      @data              = data
      json_data          = data.to_json
      @target            = options.fetch(:target)
      @x_accessor        = options.fetch(:x_accessor)  { :date }
      @y_accessor        = options.fetch(:y_accessor)  { :value }
      title              = options.fetch(:title)
      description        = options.fetch(:description) { '' }
      width              = options.fetch(:width)       { 600 }
      height             = options.fetch(:height)      { 250 }
      @time_format       = options.fetch(:time_format) { '%Y-%m-%d' }
      @is_multiple       = data.first.is_a?(Array)
      @extra_options     = options[:extra_options] || {}

      javascript_tag <<-SCRIPT
var data = #{json_data};
#{convert_data_js}
MG.data_graphic({
  title: "#{title}",
  description: "#{description}",
  data: data,
  width: #{width},
  height: #{height},
  target: '#{@target}',#{extra_options_to_options}
  x_accessor: '#{@x_accessor}',
  y_accessor: '#{@y_accessor}'
});
SCRIPT
    end

    private

    def extra_options_to_options
      @extra_options.map{ |k,v| "#{k}: #{ v.is_a?(String) ? "'#{v}'" : v }," }.join("\n  ")
    end

    def convert_data_js
      if @is_multiple
        <<-CONVERT
          for (var i = 0; i < data.length; i++) {
            data[i] = MG.convert.date(data[i], '#{@x_accessor}', '#{@time_format}');
          }
        CONVERT
      else
        "MG.convert.date(data, '#{@x_accessor}', '#{@time_format}');"
      end
    end
  end
end
