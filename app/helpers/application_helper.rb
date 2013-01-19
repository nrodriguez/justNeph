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
end
