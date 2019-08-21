# Kong DB-less deploy

For centos7 or Ubuntu18.04

### step 1

```bash
chmod +x ./*.sh
sudo ./purge [centos or ubuntu] # purge if installed before
```

### step 2
```bash
sudo ./install [centos or ubuntu]
```

### step 3

change kong.yml/kong.conf to fit your options

```bash
sudo ./deploy
```

### Done
