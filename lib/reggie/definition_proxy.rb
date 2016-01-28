
class DefinitionProxy
  def pattern(pattern_class, &block)
    pattern = Pattern.new
    pattern.instance_eval(&block)
    Reggie.registry[pattern_class] = pattern
  end
end
