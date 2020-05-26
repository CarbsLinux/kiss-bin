kiss-bin
--------

A KISS extension for dealing with binary package repositories.

I was initially planning on implementing this inside my fork of
the package manager itself, but I didn't because it would wildly
complicate the package manager.

There are some caveats that I hope to fix as I work more on this
extension

See <https://dl.carbslinux.org/pkg> for an example binary repository.


Quick Start
-----------

You can quickly setup a distribution by doing the following, also
see the Caveats section at the end of the file for the rationale
behind the linking. This sets a distribution to the current directory.

    for bin in ~/.cache/kiss/bin/*; do
        binout=${bin##*/} binname=${bin%\#*} binout=${binname}.${binout#*\#}
        ln -sf "$bin" "$binout"
    done
    
    kiss-bin-manifest | sort -rV > manifest
    
    httpd -f -p 8181


Following the previous step, you can do a quick setup in a client
by doing the following. The `$KISS_BIN` variable is explained below.

    export KISS_BIN=http://192.168.x.x:8181:personal
    
    # This will fetch the manifest from the server
    kiss-bin fetch


Using kiss-bin
--------------

`kiss-bin` can be used to track binary repositories, or downloading
singular packages without tracking any. Repositories are defined through
the `$KISS_BIN` variable. It has a comma seperated value of url and names,
`KISS_BIN=url:name,url2:name2,url3:name3`.

- `fetch`   -- Sync the manifest from repositories
- `get`     -- Install a package from the given url
- `install` -- Install a package from the repository
- `search`  -- Search for a package.
- `update`  -- Update binary packages


Usign kiss-bin-manifest
-----------------------

`kiss-bin-manifest` generates a manifest from the packages on the current
directory. If file names are given, it will generate a manifest for those
files, which can be used for incremental updates.


Caveats and Future Plans
------------------------

- In http file names with `#` are problematic. Some protocols
  expect '%23' and some don't. That's why the `#` must be
  replaced with `.`
- I plan on implementing GnuPG support.
