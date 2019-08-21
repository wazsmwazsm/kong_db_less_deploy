# Kong DB-less deploy

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
