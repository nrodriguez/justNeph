$LOAD_PATH.unshift("config/initializers")

# def require_files(extension_type)
#   extensions = Pathname.glob("lib/extensions/*.rb")
#                 .map(&:basename)
#                 .collect{|x| x.to_s.gsub(".rb", "")}

#   extensions.each do |extension|
#     require "#{extension_type}/#{extension}"
#   end
# end

# def require_and_include(extension)
#   require "extensions/#{extension}"
#   include Extensions::extensin
# end