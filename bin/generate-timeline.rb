#!/usr/bin/env ruby

require 'yaml'
require 'fileutils'

basedir = File.dirname(__FILE__)
infile = "#{basedir}/../db/timeline.yml"
outfile = "#{basedir}/../gen/timeline.md"

FileUtils.mkdir_p(File.dirname(outfile))

File.open(outfile, 'w') do |f|
  YAML.load_file(infile).each do |entry|
    f.puts "\#\# #{entry['date']}"

    entry['events'].each do |event|
      f.puts " * #{event}"
    end

    f.puts
  end
end
