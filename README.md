metrics-graphics-rails
============

[metrics-graphics](https://github.com/mozilla/metrics-graphics) is a library optimized for concise, principled data graphics and layouts. See more in [metricsgraphicsjs.org](http://metricsgraphicsjs.org)

The **metrics-graphics-rails** provides metrics-graphics for Rails and the assets pipeline.

## Dependencies

D3.js is a metrics-graphics' dependency, included in this gem by using [d3-rails](https://github.com/iblue/d3-rails) gem.

## Usage

Add this gem to your Gemfile:

    gem 'metrics-graphics-rails'

Add the following directive to your Javascript manifest file (application.js), after the `//= require jquery`:

    //= require metrics-graphics-rails

Add the following directive to your `application.css`:

    /*
    *= require metricsgraphics
    */

Enjoy.

## Versioning

metrics-graphics-rails 2.1.3 == metrics-graphics 2.1.3

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
