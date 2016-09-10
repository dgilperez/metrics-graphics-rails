require 'spec_helper'
require 'action_view'
require 'active_support'

include ActionView::Helpers::JavaScriptHelper
include ActionView::Helpers::TagHelper
include MetricsGraphicsRails::ViewHelpers

describe MetricsGraphicsRails::ViewHelpers, type: :helper do
  let(:data) { [{ date: '2014-11-01', value: 12 }, { date: '2014-11-02', value: 18 }] }

  describe "metrics_graphic_for" do
    it "should raise exception without data" do
      expect {
        metrics_graphic_for()
      }.to raise_error(ArgumentError)
    end

    it "should raise exception with data and no target option" do
      expect {
        metrics_graphic_for(data, title: 'my title')
      }.to raise_error(KeyError)
    end

    it "should raise exception with data and no title option" do
      expect {
        metrics_graphic_for(data, target: 'myid')
      }.to raise_error(KeyError)
    end

    it "should return a script tag with the MG data_graphic command valid data and target" do
      expect(metrics_graphic_for(data, target: 'myid', title: 'my title')).to eq basic_script_tag
    end
  end
end

def basic_script_tag
  result = <<-SCRIPT
<script>
//<![CDATA[
var data = [{"date":"2014-11-01","value":12},{"date":"2014-11-02","value":18}];
MG.convert.date(data, 'date', '%Y-%m-%d');
MG.data_graphic({
  title: "my title",
  description: "",
  data: data,
  width: 600,
  height: 250,
  target: 'myid',
  x_accessor: 'date',
  y_accessor: 'value'
});

//]]>
</script>
SCRIPT
.chomp!

  result.gsub!('<script>', '<script type="text/javascript">') if Rails::VERSION::MAJOR == 3
  result
end
