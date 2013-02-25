# multi_toml

multi_toml is an interface gem for https://github.com/mojombo/toml.

There are many great TOML libraries out there. If you're writing an application,
you should be able to use any one you want. If you're writing a library that
other libraries or applications will use, you should use multi_toml so that you
don't impose a particular implementation on the consuming application.

## Implementations

 * https://rubygems.org/gems/toml
 * https://rubygems.org/gems/toml-ruby
 * https://rubygems.org/gems/toml2

## Seriously?

Not entirely seriously, no.

## But Why?

Because application developers shouldn't have to install 3 TOML libraries.

## Usage

Add one of the supported gems to your `Gemfile` (or you global gem path), then

```ruby
require 'multi_toml'
MultiToml.load('a toml string')
```

MultiToml will try to guess the best adapter for you. If you need to specify an
adapter:

```ruby
require 'multi_toml'
MultiToml.adapter = :toml
MultiToml.load('a toml string') # parsed with the toml gem
```
