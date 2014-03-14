# GitLabSystemHooksReceiver

Process GitLab system hooks.

For now, this Rack based web application appends web hooks to a new project on GitLab via system hooks.

## Installation

Add this line to your application's Gemfile:

    gem "gitlab-system-hooks-receiver"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gitlab-system-hooks-receiver

## Usage

### Use part of git-utils/github-post-receiver

You can use this web application with [clear-code/git-utils](https://github.com/clear-code/git-utils "clear-code/git-utils").

Clone [clear-code/git-utils](https://github.com/clear-code/git-utils "clear-code/git-utils").

```
$ git clone https://github.com/clear-code/git-utils.git
```

Add Gemfile.

```
source "https://rubygems.org/"

gem "rack"
gem "racknga"
gem "unicorn"
gem "gitlab-system-hooks-receiver"
```

NOTE: You can use passenger instead of unicorn.

Do `bundle install`.

Edit config.ru.

```
...
require "gitlab-system-hooks-receiver"
map "/system-hooks-receiver/" do
  run GitLabSystemHooksReceiver.new(options)
end
```

Configure your web server if you need.

### Use standalone

You can use this web application standalone.

Clone this repository.

```
$ git clone https://github.com/clear-code/gitlab-system-hooks-receiver.git
$ cd gitlab-system-hooks-receiver
$ bundle install --path vendor/bundle
$ bundle exec unicorn
```

Configure your web server if you need.

### Configuration

Add your config.yaml as followings.

config.yaml
```
# private token for the user who has admin privilege
private_token: VERY_SECRET_TOKEN
api_end_point: https://gitlab.example.com/api/v3
web_hooks:
  - http://hook.example.com/post-receiver1
  - http://hook.example.com/post-receiver2
  - http://hook.example.com/post-receiver3
```

## Contributing

1. Fork it ( http://github.com/clear-code/gitlab-system-hooks-receiver/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
