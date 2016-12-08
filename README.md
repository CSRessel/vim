Overview
========
For portability and backups.


Installation:
-------------

```
  $ git clone --recursive https://github.com/CSRessel/vim.git
```

Or for old git versions, or an already downloaded repo sans plugins:
```
  $ git clone https://github.com/CSRessel/vim.git
  $ git submodule update --init --recursive
```


Updating Plugins:
-----------------

```
  $ git submodule foreach git pull origin master
```

