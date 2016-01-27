require 'spec_helper'

describe Reggie do
  it 'has a version number' do
    expect(Reggie::VERSION).not_to be nil
  end

  it 'returns a Pattern match object' do
    expect(Reggie::Pattern.match).not_to be nil
  end
end
