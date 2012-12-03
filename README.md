# RubyTemplate

RubyTemplate gives you a simple means of producing json in your views by letting you write normal ruby.  The return value of your template will be passed through ActiveSupport::JSON.encode to produce the actual json.

## Installation

Add this line to your application's Gemfile:

    gem 'ruby_template'

And then execute:

    $ bundle

## Usage

The template users/show.json.rb:

```ruby
{
  :id   => user.id,
  :name => user.name,
}
```

will become:

```json
{"user" : {"id" : 123, "name" : "Scott"}}
```

Simple as that.

### Partials

Partials work mostly as expected:

```ruby
# in (users/show.json.rb)
render(:partial => "users/user", object: @user)
```

```ruby
# in (users/_user.json.rb)
{
  :id   => user.id,
  :name => user.name,
}
```

Note:  when rendering partials, the return value is not a string (as normal), but instead we pass up the return value of the template.

### Extending partials using deep_merge

It's nice to be DRY with your templates.  You can use deep_merge to extend a common partial in contexts where extra information is needed. For example, say we want to include some private information after a user is created:

```ruby
# in (users/create.json.rb)
render(:partial => "users/user", object: @user).deep_merge({
  :token => @user.login_token
})
```

### Collections

Rendering a partial with the collection option does not work. Instead, use:

```ruby
# in (users/index.json.rb)
{
  :users => @users.map{|u| render(:partial => "users/user", object: u)}
}
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
