# multi_toml

multi_toml is an interface gem for https://github.com/mojombo/toml.

There are many great TOML libraries out there. If you're writing an application,
you should be able to use any one you want. If you're writing a library that
other libraries or applications will use, you should use multi_toml so that you
don't impose a particular implementation on the consuming application.

## Implementations

 * https://rubygems.org/gems/toml
 * https://rubygems.org/gems/toml-ruby
 * https://rubygems.org/gems/toml_parser-ruby
 * https://rubygems.org/gems/toml2

## Seriously?

Not entirely seriously, no.

## But Why?

Because application developers shouldn't have to install 3 TOML libraries.
