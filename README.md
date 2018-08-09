# GoogleTranslate

> Translate small text snippet with the **free** and **unlimited** Google Translate API.

[Reference](https://ctrlq.org/code/19909-google-translate-api)

## Requirements

- ruby `>= 2.3.0`
- gem `bundler`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google_translate', git: 'git@github.com:masterT/google-translate.git'
```

And then execute:

```shell
bundle
```

Or install it yourself as:

```shell
git clone git@github.com:masterT/google-translate.git
cd google-translate 
gem build google_translate.gemspec
gem install google_translate-0.0.1.gem
```

## Usage

```ruby
require 'google_translate'

# Translate 'hi' from english to french.
GoogleTranslate.translate('Hi', {source: :en, target: :fr})

# Auto detect source language.
GoogleTranslate.translate('Hi', {target: :fr})
# => "salut"

# Option target is required.
GoogleTranslate.translate('Hi', {source: :en})
# ArgumentError:
#   Expect options 'target'.

GoogleTranslate::VERSION
# => "0.0.1"
```

## CLI

```
$ google_translate -h
usage: google_translate [options] <text>
    -s, --source   the source language
    -t, --target   the target language
    -v, --version
    -h, --help
    
$ google_translate -t fr 'Hi how are you?'
Salut comment ca va?

$ google_translate -s fr -t fr 'Hi how are you?'
Hi how are you?  

$ google_translate -v
0.0.1
```

## Development

Install dependencies:

```shell
bundle
```

Test the CLI locally:

```shell
./bin/google_translate -t fr 'Hi how are you?'
Salut comment ca va?
```

Test the gem locally using [IRB](https://ruby-doc.org/stdlib-2.4.3/libdoc/irb/rdoc/IRB.html):

```
$ irb -I lib -r google_translate

irb(main):001:0> GoogleTranslate.translate('Hi', {source: :en, target: :fr})
=> "salut"

irb(main):002:0> GoogleTranslate::VERSION
=> "0.0.1"
```

The `-I` option loads the `lib` files and the `-r` option loads the module `google_translate`. 

## Test

Execute:

```shell
bundle exec rspec
```

## License

[CC0](https://creativecommons.org/share-your-work/public-domain/cc0/)
