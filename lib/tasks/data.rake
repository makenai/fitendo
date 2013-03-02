require 'json'

namespace "app" do

  def convert_time( time )
    minutes, seconds = time.split(':')
    seconds.to_i + ( minutes.to_i * 60 )
  end

  desc "Turn timing text files into json data"
  task :compile_json do
    Dir.glob('data/*.txt').each do |file|
      name = file.split('/').last.split('.').first
      data = []
      File.open( file ).each_line do |line|
        start_time, end_time, level = line.chomp.split(/\s+/, 3)
        data << [ convert_time( start_time ), convert_time( end_time ), level ]
      end
      File.open("app/assets/javascripts/timing/#{name}.js", 'w') do |file|
        file.puts "var GAME_TIMING = " + JSON.pretty_generate( data ) + ';'
      end
    end
  end
  
end