require 'spec_helper'

describe Reggie do

  before do
    Reggie.define do
      pattern :user_name do
        first "Carlos"
        last "Gabaldon"
      end
    end
  end

  it 'has a version number' do
    expect(Reggie::VERSION).not_to be nil
  end

  it 'has #build which creates a pattern object' do
    user_name_pattern = Reggie.build(:user_name)
    expect(user_name_pattern.class).to eq UserName
    expect(user_name_pattern.first).to eq "Carlos"
    expect(user_name_pattern.last).to eq "Gabaldon"
  end

  it 'has #matches which returns an array of matches' do
    user_name_pattern = Reggie.build(:user_name)
    user_name = 'my-us3r_n4m3'
    expect(user_name_pattern.matches(user_name).class).to eq Array
    expect(user_name_pattern.matches(user_name)).to eq ['my-us3r_n4m3']
  end
end
