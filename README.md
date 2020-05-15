# README

use with gitpod:
```
https://gitpod.io#https://github.com/gaurangrshah/rails-alphablog
```

to use locally: 
```
git clone git@github.com:gaurangrshah/rails-starter.git .
```

run:
```shell
yarn
```

```shell
bundle install
```

```shell
rails db:migrate
```

When using gitpod you must comment out the following whitelisting (which was added for gitpod)
```ruby
# app/config/environments/development.rb
  # Whitelist one hostname
  config.hosts << "<URL-TO-APP>"
  # example: 
  # 3000-ac200ee9-27ed-424d-9c71-fd9090907aca.ws-us02.gitpod.io
```


remove zsh