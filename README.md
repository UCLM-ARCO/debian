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

* Configure your ~/.ssh/config like this:

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
