# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Forvo, :vcr do
  it 'should download the file to the /tmp folder' do
    file_path = Forvo.download('wie')
    Dir.entries("/tmp").any? {|x| file_path.include? x }.should be_true
  end

  it 'should return the file_path when downloading' do
    file_path = Forvo.download('wie')
    file_path.should match /\/tmp\/.*.mp3/
  end
end
