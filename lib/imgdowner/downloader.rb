require 'open-uri'
module Downloader
    class FormatErr < StandardError
    end
    class ExistErr < StandardError
    end
    class ResponseErr < StandardError
    end
    def download(src)
        errMsg = ["you should check your format in (jpg/jpeg/png)",
            "you should check your format in (https|http://,,,)",
            "your want to create file: {file}, which is exist",
            "download status code {status} is not expected"   
        ]
        raise FormatErr.new(errMsg[0]) unless src =~ /(.*)(\.jpg|\.png\.jpeg)$/
        begin
            @dir = "./img" unless defined? @dir
            Dir.mkdir(@dir, 0700) unless Dir.exist?(@dir)
            raise FormatErr.new(errMsg[1]) unless src =~ /(http|https):\/\/(.+?)([^\/]+)$/
            placed = File.join(@dir, $3)
            @mod_placed = placed
            raise ExistErr.new(errMsg[2].sub(/{file}/, placed)) if File.exist?(placed)
            open(src) do |res|
                raise ResponseErr.new(errMsg[3].sub(/{status}/, res.status[0])) unless res.status[0] == "200"
                File.open(placed, "w") do |f|
                    f.binmode
                    f.write(res.read)
                end
            end
        rescue => exception
            raise exception
        else
        end
    end
    # It's belong to mod create for out-world
    def placed()
        @mod_placed
    end
end