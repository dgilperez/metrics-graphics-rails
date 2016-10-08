# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'metrics-graphics-rails/version'

Gem::Specification.new do |s|
  s.name        = 'metrics-graphics-rails'
  s.authors     = ['David Gil']
  s.description = "metrics-graphics for the Rails Assets Pipeline"
  s.summary     = 'metrics-graphics-rails is an assets gem for metrics-graphics'
  s.homepage    = 'https://github.com/dgilperez/metrics-graphics-rails'
  s.version     = MetricsGraphicsRails::VERSION

  s.files = Dir['{lib,vendor}/**/*'] + ["README.md"]

  s.add_dependency 'railties', '>= 3.1'
  s.add_dependency 'd3-rails', '~> 3.5'
  s.add_dependency 'json', '>= 1.8.3'

  s.add_development_dependency 'rails', '>= 3.1'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'appraisal'
end
