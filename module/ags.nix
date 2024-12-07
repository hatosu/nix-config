{ pkgs
, inputs
, ...
}:
let
  monitor = "HDMI-A-1";

  zip = builtins.fetchurl {
    url = "https://files.catbox.moe/959pz9.zip";
    name = "types.zip";
    sha256 = "1d3vq2a2kf1ld6fcjb5z74nlm4pcf5gj7xqg5657z5jrvkab3i0j";
  };

  libs = pkgs.runCommand "libs" { } ''
    mkdir -p $out/files
    ${pkgs.unzip}/bin/unzip ${zip} -d "$out/files"
  '';

  configjs = builtins.toFile "config.js" ''
    import { NotificationPopups } from "./notificationPopups.js"
    App.config({
        style: App.configDir + "/style.css",
        windows: [
            NotificationPopups(),
        ],
    })
  '';

  tsconfigjson = builtins.toFile "tsconfig.json" ''
    {
      "compilerOptions": {
        "target": "ES2022",
        "module": "ES2022",
        "lib": [
          "ES2022"
        ],
        "allowJs": true,
        "checkJs": true,
        "strict": true,
        "noImplicitAny": false,
        "baseUrl": ".",
        "typeRoots": [
          "./types"
        ],
        "skipLibCheck": true
      }
    }
  '';

  stylecss = builtins.toFile "style.css" ''
    window.notification-popups box.notifications {
        padding: .5em;
    }
    .icon {
        min-width: 60px;
        min-height: 60px;
        margin-right: 1em;
    }
    .icon image {
        font-size: 60px;
        /* to center the icon */
        margin: 10px;
        color: @theme_fg_color;
    }
    .icon box {
        min-width: 55px;
        min-height: 55px;
        border-radius: 8px;
    }
    .notification {
        min-width: 350px;
        border-radius: 10px;
        padding: 1.1em;
        margin: 1.1em;
        border: 1.5px solid #C1716D;
        background-color: @theme_bg_color;
    }
    .notification.critical {
        border: 1px solid lightcoral;
    }
    .title {
        color: @theme_fg_color;
        font-size: 1.4em;
    }
    .body {
        color: @theme_unfocused_fg_color;
    }
    .actions .action-button {
        margin: 0 .4em;
        margin-top: .8em;
    }
    .actions .action-button:first-child {
        margin-left: 0;
    }
    .actions .action-button:last-child {
        margin-right: 0;
    }
  '';

  notificationPopupsjs =
    let
      u = "\${n.urgency}";
      i = "\${image}";
    in
    builtins.toFile "notificationPopups.js" ''
      const notifications = await Service.import("notifications")
      /** @param {import('resource:///com/github/Aylur/ags/service/notifications.js').Notification} n */
      function NotificationIcon({ app_entry, app_icon, image }) {
          if (image) {
              return Widget.Box({
                  css: `background-image: url("${i}");`
                      + "background-size: contain;"
                      + "background-repeat: no-repeat;"
                      + "background-position: center;",
              })
          }
          let icon = "dialog-information-symbolic"
          if (Utils.lookUpIcon(app_icon))
              icon = app_icon
          if (app_entry && Utils.lookUpIcon(app_entry))
              icon = app_entry
          return Widget.Box({
              child: Widget.Icon(icon),
          })
      }
      /** @param {import('resource:///com/github/Aylur/ags/service/notifications.js').Notification} n */
      function Notification(n) {
          const icon = Widget.Box({
              vpack: "start",
              class_name: "icon",
              child: NotificationIcon(n),
          })
          const title = Widget.Label({
              class_name: "title",
              xalign: 0,
              justification: "left",
              hexpand: true,
              max_width_chars: 24,
              truncate: "end",
              wrap: true,
              label: n.summary,
              use_markup: true,
          })
          const body = Widget.Label({
              class_name: "body",
              hexpand: true,
              use_markup: true,
              xalign: 0,
              justification: "left",
              label: n.body,
              wrap: true,
          })
          const actions = Widget.Box({
              class_name: "actions",
              children: n.actions.map(({ id, label }) => Widget.Button({
                  class_name: "action-button",
                  on_clicked: () => {
                      n.invoke(id)
                      n.dismiss()
                  },
                  hexpand: true,
                  child: Widget.Label(label),
              })),
          })
          return Widget.EventBox(
              {
                  attribute: { id: n.id },
                  on_primary_click: n.dismiss,
              },
              Widget.Box(
                  {
                      class_name: `notification ${u}`,
                      vertical: true,
                  },
                  Widget.Box([
                      icon,
                      Widget.Box(
                          { vertical: true },
                          title,
                          body,
                      ),
                  ]),
                  actions,
              ),
          )
      }
      export function NotificationPopups(monitor = 0) {
          const list = Widget.Box({
              vertical: true,
              children: notifications.popups.map(Notification),
          })
          function onNotified(_, /** @type {number} */ id) {
              const n = notifications.getNotification(id)
              if (n)
                  list.children = [Notification(n), ...list.children]
          }
          function onDismissed(_, /** @type {number} */ id) {
              list.children.find(n => n.attribute.id === id)?.destroy()
          }
          list.hook(notifications, onNotified, "notified")
              .hook(notifications, onDismissed, "dismissed")
          return Widget.Window({
              monitor,
              name: `notifications${monitor}`,
              class_name: "notification-popups",
              anchor: ["top", "right"],
              child: Widget.Box({
                  css: "min-width: 2px; min-height: 2px;",
                  class_name: "notifications",
                  vertical: true,
                  child: list,
                  /** this is a simple one liner that could be used instead of
                      hooking into the 'notified' and 'dismissed' signals.
                      but its not very optimized becuase it will recreate
                      the whole list everytime a notification is added or dismissed */
                  // children: notifications.bind('popups')
                  //     .as(popups => popups.map(Notification))
              }),
          })
      }
    '';
in
{
  home-manager.users.hatosu.home.file."types" = {
    source = "${libs}/files/types/";
    target = ".config/ags/types/";
    force = true;
  };

  home-manager.users.hatosu.home.file."config.js" = {
    source = configjs;
    target = ".config/ags/config.js";
    force = true;
  };

  home-manager.users.hatosu.home.file."tsconfig.json" = {
    source = tsconfigjson;
    target = ".config/ags/tsconfig.json";
    force = true;
  };

  home-manager.users.hatosu.home.file."style.css" = {
    source = stylecss;
    target = ".config/ags/style.css";
    force = true;
  };

  home-manager.users.hatosu.home.file."notificationPopups.js" = {
    source = notificationPopupsjs;
    target = ".config/ags/notificationPopups.js";
    force = true;
  };

  home-manager.users.hatosu.home.packages = [ pkgs.pinned.ags ];
}
