require 'reggie/version'
require 'reggie/definition_proxy'
require 'reggie/pattern'
require 'reggie/patterns'

module Reggie
  @registry = {}

  def self.registry
    @registry
  end

  def self.define(&block)
    definition_proxy = DefinitionProxy.new
    definition_proxy.instance_eval(&block)
  end

  def self.build(pattern_class, overrides = {})
    instance = pattern_class.new
    pattern = registry[pattern_class]
    attributes = pattern.attributes.merge(overrides)
    attributes.each do |attribute_name, value|
      instance.send("#{attribute_name}=", value)
    end
    instance
  end
end
