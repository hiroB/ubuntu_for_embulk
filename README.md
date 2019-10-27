# install

* see https://github.com/embulk/embulk

curl --create-dirs -o embulk/bin/embulk -L "https://dl.bintray.com/embulk/maven/embulk-0.9.9.jar"
chmod +x embulk
echo 'export PATH="/app/embulk/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

embulk mkbundle bundle

```
2019-10-27 04:59:32.041 +0000: Embulk v0.9.9
Initializing bundle_dir...
  Creating Gemfile
  Creating .bundle/config
  Creating embulk/input/example.rb
  Creating embulk/output/example.rb
  Creating embulk/filter/example.rb
```

cd bundle
embulk bundle install --path=vendor/bundle


# test
```
# ls -ltr
total 0
drwxr-xr-x 3 root root  96 10月 27 05:35 bin
drwxr-xr-x 7 root root 224 10月 27 05:39 bundle
drwxr-xr-x 4 root root 128 10月 27 05:50 try1
# cd try1/
# ls -l
total 4
-rw-r--r-- 1 root root 580 10月 27 05:50 config.yml
drwxr-xr-x 3 root root  96 10月 27 05:51 csv
# embulk preview -b ../bundle config.yml
```

