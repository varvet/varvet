say_status "varvet", "Booting main frame\n", :yellow

say_status "varvet", "Making sure standards are followed\n", :yellow
directory "#{File.dirname(__FILE__)}/files", "#{destination_root}/"
