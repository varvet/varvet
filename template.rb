say_status "varvet", "Hello\n", :yellow

say_status "varvet", "Copying files\n", :yellow
directory "#{File.dirname(__FILE__)}/files", "#{destination_root}/"
