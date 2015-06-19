echo $PWD
alias jekyll='sudo docker run --rm -v "$PWD:/src" -p 4000:4000 aokinobu/jekyll'
jekyll clean
jekyll build
jekyll serve -H 0.0.0.0
