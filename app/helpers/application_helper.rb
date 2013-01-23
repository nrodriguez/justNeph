require "ruby-debug"
Debugger.start
module ApplicationHelper

  def include_scripts
    @scripts = [
      "jquery-ui.min.js", 
      "jquery.easing.1.3.js", 
      "plugins/nivo/jquery.nivo.slider.pack.js",
      "plugins/prettyphoto/jquery.prettyPhoto.js",
      "plugins/tipsy/jquery.tipsy.js", 
      "plugins/video-js/video.js", 
      "plugins/tweet/jquery.tweet.js",
      "plugins/jquery-validate/jquery.validate.min.js", 
      "scripts.js"
    ]
  end

  def instagram_photos(list_size)
    photos = {}
    list_size.times.each do |i|
      media = Instagram.user_recent_media[i]
      photos["photo_#{i}".to_sym] = { 
        :url => media.images.standard_resolution.url,
        :thumbnail => media.images.thumbnail.url,
        :caption => media.caption.text,
        :last_in_set => ((i + 1) % 3) == 0 ? true : false #Signal when to put the last element class
      }
    end
    [photos].map(&:values).flatten
  end
end
