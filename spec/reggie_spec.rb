require 'spec_helper'

describe Reggie do
  it 'has a version number' do
    expect(Reggie::VERSION).not_to be nil
  end

  it 'returns a Pattern match object' do

    Reggie.define do
      pattern UserName do
        first "Carlos"
        last "Gabaldon"
      end
    end

    user_name_pattern = Reggie.build(UserName)
    expect(user_name_pattern.first).to eq "Carlos"
    expect(user_name_pattern.last).to eq "Gabaldon"

  end
end
