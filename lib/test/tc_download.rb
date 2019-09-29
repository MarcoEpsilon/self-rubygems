$:.unshift File.join(File.dirname(__FILE__), "..", '..', "lib")
require 'test/unit'
require 'imgdowner/downloader'
class Use < Test::Unit::TestCase
    include Downloader
    # init ...
    def setup()
        @dir = "./img"
        @direxist = Dir.exist?(@dir)
        @test_src = 'https://w.wallhaven.cc/full/r2/wallhaven-r2qqlj.jpg'
    end
    def test_download()
        begin
            self.download(@test_src)
            assert(File.exist?(self.placed), 'download failed')
        rescue => exception
            assert(false, "download exception: #{exception.message}")
        end
    end
    # destroy ...
    def teardown()
        File.delete(self.placed) if self.placed && File.exist?(self.placed)
        Dir.rmdir(@dir) unless @direxist
    end
end