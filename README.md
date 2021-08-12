# xmrig-pack

[![Build Status](https://ci.mrcyjanek.net/badge/74d87955?branch=master)](https://ci.mrcyjanek.net/repos/449)

Because I'd like to have donationless xmrig it in repo.

## Installation

First of all you need to install my repo

```bash
# wget 'https://static.mrcyjanek.net/abstruse/apt-repository/mrcyjanek-repo/mrcyjanek-repo_2.0-1_all.deb' -O cyjanrepo.deb && \
    apt install ./cyjanrepo.deb && \
    rm ./cyjanrepo.deb && \
    apt update
```

Then you need to install `xmrig-dontationless` package:
```bash
# apt install xmrig-donationless
```

Package version match the version distributed on the official xmrig site, if you notice that the version is out of date (I use it frequently so it should be up to date) - please open an issue, I'll update it.

If you do not want to install my repo for some reason: https://static.mrcyjanek.net/abstruse/apt-repository/xmrig/

Aaaand if you don't like to use .deb, but would like to have a binary: https://static.mrcyjanek.net/abstruse/xmrig/

