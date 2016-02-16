require 'reggie/version'
require 'reggie/definition_proxy'
require 'reggie/pattern'
require 'reggie/patterns'
require 'reggie/match'
require 'byebug'

module Reggie
  @registry = {}

  def self.registry
    @registry
  end

  def self.define(&block)
    definition_proxy = DefinitionProxy.new
    definition_proxy.instance_eval(&block)
  end

  def self.build(pattern_symbol, overrides = {})
    pattern_class = classify(pattern_symbol)
    instance = pattern_class.new
    pattern = registry[pattern_symbol]
    attributes = pattern.attributes.merge(overrides)
    attributes.each do |attribute_name, value|
      instance.send("#{attribute_name}=", value)
    end
    instance.class.send(:define_method, :matches,
      ->(values) {
        match = Match.new(pattern: pattern, string_to_match: values)
        match.capture
      })
    instance
  end

  private

  def self.classify(pattern_symbol)
    Object.const_get(pattern_symbol.to_s.split('_').collect(&:capitalize).join)
  end
end
