# refinary-move-test
Build CMS demo with Rails

## RefineryCMS-Rails setup

### Ubuntu
`sudo apt-get update`

### RMV install
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm
```

### Ruby install with [rvm](https://rvm.io/rvm/install)
1. Check Ruby available versions

`rvm list known`

2. Choose v2.2+

`rvm install 2.4.1`

3. Set default version globally

`rvm use 2.4.1 --default`

### Install DB
#### MySql
`sudo apt-get install mysql-client mysql-server libmysqlclient-dev`

### Install ImageMagick
`sudo apt-get install imagemagick`

### Install RefineryCMS
`gem install refinerycms`

### Install NodeJS
```
sudo apt-get install nodejs
```

### Install Bundler
`gem install bundler`

### Start App
```
bundle install
rails server
```

Go to http://localhost:3000/refinery and setup your admin user
