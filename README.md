## Local build 
Using dccker jekyll
 
```
jekyll/jekyll docker image pull
```

build 
```
cd glytoucan.github.io
docker run --rm   --volume="$PWD:/srv/jekyll"   -it jekyll/jekyll:$JEKYLL_VERSION   jekyll build
```

browse
```
cd glytoucan.github.io/_site
live-server 
```
or VS Code `Go Live`

local: http://127.0.0.1:5500/_site/