# crafter_dev_server

We had fun while it lasted! (newer developments at [oilboi hideout](https://github.com/oilboi))

## Components

### [Minetest daily builds](https://launchpad.net/~minetestdevs/+archive/ubuntu/daily-builds) PPA

### crontab

Keep the daily build daily updated, daily.

```
# m h  dom mon dow   command
05 15 * * * apt update ; apt install -y --only-upgrade minetest && sudo -u deploy XDG_RUNTIME_DIR="/run/user/$(id -u deploy)" systemctl --us>
```

### [webhookd](https://github.com/ncarlier/webhookd)

Notify server of repo updates via webhook (pull.sh)

### Some systemd services

`discordmt@.service`, Discord<->Minetest chat bridge
`log2discord@.service`, posts server crash messages to Discord (bollocks.sh)
`minetest@.service`, keep Minetest server up
`mtlog@.service`, cut and trim log file for http exposure via nginx
`webhook@.service`, keep webhookd running

### nginx + certbot

For hosting index.html and symlinked log files

### ufw firewall ports

22
80
443
30000
8080
8081

### Other stuff

`map.sql` is split in 100MB files with

`split -d --bytes=100M map.sqlite map.sqlite`

Reassemble with

`cat map.sqlite* > map.sqlite`
