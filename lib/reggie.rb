require 'reggie/version'
require 'reggie/definition_proxy'
require 'reggie/pattern'
require 'reggie/patterns'
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
        # To do
        # 1. Create regex matching object
        # 2. Use the pattern_class to match against the values passed
        # 3. Return the matches
        # * This logic should live in a regex matching class..create one..
        [values]
      })
    instance
  end

  private

  def self.classify(pattern_symbol)
    Object.const_get(pattern_symbol.to_s.split('_').collect(&:capitalize).join)
  end
end
