require 'chunky_png'
require 'pry'

#get all images in source folder, by date, oldest to newest
files_sorted_by_time = Dir['source/*'].sort_by{ |f| File.mtime(f) }

# find the largest image
# max_width = 0
# max_height = 0
# files_sorted_by_time.each {|file| 
#     image = ChunkyPNG::Image.from_file(file)
#     puts "this width:" + image.width.to_s
#     puts "this height:" + image.height.to_s
#     max_width = image.width if image.width > max_width
#     max_height = image.height if image.height > max_height
# }
# puts "max_width:" + max_width.to_s
# puts "max_height:" + max_height.to_s

# files_sorted_by_time.each {|file| 
#     filename = file.split("/").last
#     exec_str = "convert source/#{filename} -resize 2193x1214 -background white -gravity center -extent 2193x1214 output/#{filename}"
#     system exec_str
# }

files_sorted_by_time.each {|file| 
    filename = file.split("/").last
    exec_str = "convert source/#{filename} -resize 1097x607 -background white -gravity center -extent 1097x607 output_half/#{filename}"
    system exec_str
}
    
# https://stackoverflow.com/questions/44720580/resize-image-canvas-to-maintain-square-aspect-ratio-in-python-opencv
# https://gist.github.com/jeffkreeftmeijer/951528
# https://rubygems.org/gems/chunky_png/versions/1.3.5
# https://devhints.io/chunky_png
# https://ezgif.com/

# scale = 0.75
# files_sorted_by_time.each {|file|
#     image = ChunkyPNG::Image.from_file(file)
#     resized_image = ChunkyPNG::Image.new((image.width * scale).round, (image.height * scale).round)
#     resized_image.pixels.map!.with_index do |pixel, index|
#         x, y = index % resized_image.width, (index / resized_image.width).floor
#         image[x / scale, y / scale]
#     end
#     resized_image.save("#{file.gsub("source", "output")}")
# }