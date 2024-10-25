{pkgs,inputs,...}:

let

toml = "${inputs.personal-files}/other/yazi/flavors/catppuccin-frappe.yazi/flavor.toml";

xml = "${inputs.personal-files}/other/yazi/flavors/catppuccin-frappe.yazi/tmtheme.xml";

in

{programs.yazi={package=pkgs.yazi;enable=true;
enableZshIntegration=true;enableNushellIntegration=false;

    theme.manager = {
      border_style = {
        fg = "darkgray";
      };
    };

theme.flavor = { use = "catppuccin-frappe"; };};

home.file = {
"toml"={source=toml;force=true;
target="/home/hatosu/.config/yazi/flavors/catppuccin-frappe.yazi/flavor.toml";};
"xml"={source=xml;force=true;
target="/home/hatosu/.config/yazi/flavors/catppuccin-frappe.yazi/tmtheme.xml";};
};

}
