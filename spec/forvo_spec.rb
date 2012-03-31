# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Forvo, :vcr do
  it 'should download the file to the /tmp folder' do
    file_path = Forvo.download(['wie'])
    Dir.entries("/tmp").any? {|x| file_path.include? x }.should be_true
  end

  it 'should return the file path after downloading' do
    file_path = Forvo.download(['wie'])
    file_path.should match /\/tmp\/.*.mp3/
  end

  it 'should download a composed word' do
    Forvo.download(['guten', 'tag']).should be_true
  end

  it 'should return a word not found message when the search is unsuccessful' do
    message = Forvo.download(['inexistent', 'word'])
    message.should =~ /'inexistent word'/
  end
end
