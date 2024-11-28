{ pkgs, ... }: { home-manager.users.hatosu.home = {

  packages = with pkgs; [ radio-cli ];

  file."config" = let config = builtins.toFile "config.json" ''
    {
	    "config_version": "2.3.0",
	    "max_lines": 7,
	    "country": "JP",
	    "data": [
		    {
			    "station": "lofi",
			    "url": "https://www.youtube.com/live/jfKfPfyJRdk?si=WDl-XdfuhxBfe6XN"
		    },
		    {
			    "station": "japan",
			    "url": "https://www.youtube.com/live/ohI356mwBp8?si=OWMhLG-aEh8KUxL3"
		    }
	    ]
    }
  ''; in { source = config; target = ".config/radio-cli/config.json"; force = true; };

};}
