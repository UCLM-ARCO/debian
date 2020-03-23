# ARCO Debian repository

Debian packages are at: <https://uclm-arco.github.io/debian/>


## Upload new packages

* To upload debian packages clone this repository:
```bash
john@laptop:~/repos$ git clone git@github.com:UCLM-ARCO/debian.git arco-debian
```

* Start the vagrant box included:
```
john@laptop:~/repos/arco-debian$ vagrant up
```

* Configure your `~/.ssh/config` like this:
```
Host debrepo
     Hostname localhost
     Port 2292
     IdentityFile ~/repos/arco-debian/.vagrant/machines/default/virtualbox/private_key
```

* Compile your package and upload to that vm using reprepro.
* Add new contents in directory `docs` and push changes:
```
john@laptop:~/repos/arco-debian$ git add docs
john@laptop:~/repos/arco-debian$ git commit -a -m "upload package-version"
john@laptop:~/repos/arco-debian$ git push
```

## Support on ian

* Install latest `ian` package version (>= 0.20200323.15-1)
* Configure your `.config/ian/config` like this:
```
export DEBFULLNAME="John Doe"
export DEBEMAIL=john.doe@example.net
export DEBSIGN_KEYID=<your gpg key-id>
export DEBREPO_URL=vagrant@debrepo/shared
```

* New `ian` generates a `dupload.conf` file to upload the package to the vm.
