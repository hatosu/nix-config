{ pkgs, ... }: {
  home-manager.users.hatosu.home = {
    packages = with pkgs; [ radio-cli ];

    file."radio-cli-config" =
      let
        config = pkgs.writeText "config.json" ''
          {
           "config_version": "2.3.0",
           "max_lines": 7,
           "country": "JP",
           "data": [
            {
             "station": "tbs",
             "url": "https://www.youtube.com/live/ohI356mwBp8?si=OWMhLG-aEh8KUxL3"
          },
            {
          	"station": "ann",
          	"url": "https://www.youtube.com/live/coYw-eVU0Ks?si=Syrt6q9uY13_YDIh"
          },
            {
          	"station": "ntv",
          	"url": "https://www.youtube.com/live/L6h5VKq7ZV0?si=0fdHLC13oGCHFozi"
          },
            {
          	"station": "anime",
          	"url": "https://www.youtube.com/live/4FBW3mkdKOs?si=s3XXq9WcTKaV-0ty"
          },
            {
          	"station": "jpop",
          	"url": "https://www.youtube.com/live/tr77RbnfYIU?si=DoeLhhKvLZraF9En"
          },
            {
             "station": "lofi",
             "url": "https://www.youtube.com/live/jfKfPfyJRdk?si=WDl-XdfuhxBfe6XN"
            }
           ]
          }
        '';
      in
      {
        source = config;
        target = ".config/radio-cli/config.json";
        force = true;
      };
  };
}
