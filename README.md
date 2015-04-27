metrics-graphics-rails
============

[metrics-graphics](https://github.com/mozilla/metrics-graphics) is a library optimized for concise, principled data graphics and layouts. See more in [metricsgraphicsjs.org](http://metricsgraphicsjs.org)

The **metrics-graphics-rails** provides metrics-graphics for Rails and the assets pipeline.

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

## D3 dependency

D3.js is a metrics-graphics' dependency. It will be required automátically by requiring metrics-graphics-rails. If your project already includes D3, you can ``//= require metricsgraphics`` instead to prevent duplicated requires.

## ActionView Graph Helper

From the [metrics-graphics example](http://metricsgraphicsjs.org/):

    MG.data_graphic({
        title: "Downloads",
        description: "This graphic shows a time-series of downloads.",
        data: [{'date':new Date('2014-11-01'),'value':12},
               {'date':new Date('2014-11-02'),'value':18}],
        width: 600,
        height: 250,
        target: '#downloads',
        x_accessor: 'date',
        y_accessor: 'value'
    })

This graph can be rendered in a Rails view template with this helper:

    = metrics_graphic_for data, title: "Downloads", description: "This graphic shows a time-series of downloads.", width: 600, height: 250, target: '#downloads', x_accessor: 'date', y_accessor: 'value', time_format: '%Y-%m-%d'

where ``data`` is an Array of Hashes of points with a ``date`` and a ``value`` keys and values. Ex: ``[{date: '2014-11-01', value: 12}, {date: '2014-11-02', value: 18}]``

`width`, `height`, `time_format` and `description` are optional options. 

## Versioning

metrics-graphics-rails 2.1.3 == metrics-graphics 2.1.3

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
