say_status "varvet", "Booting main frame\n", :yellow

say_status "varvet", "Making sure standards are followed\n", :yellow
copy_file "#{File.dirname(__FILE__)}/.rubocop.yml", "#{destination_root}/.rubocop.yml"
