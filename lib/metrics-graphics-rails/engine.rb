module MetricsGraphicsRails
  class Engine < ::Rails::Engine
    initializer 'metrics-graphics-rails.helper' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
