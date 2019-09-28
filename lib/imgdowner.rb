require "imgdowner/version"
require "imgdowner/downloader.rb"
module Imgdowner
  class Error < StandardError; end
  # Your code goes here...
  include Downloader
end
