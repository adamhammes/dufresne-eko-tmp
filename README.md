## Dependencies

There are two main ways to run this application: with Docker or by setting up a local PHP environment.

The Docker method is very easy to get going, but runs very slowly on Mac OS X due to [performance problems with mounted volumes](https://github.com/docker/for-mac/issues/77) (on the order of ~3 second page load times).
The PHP setup is more involved, but very fast once done.

If going the Docker route, you'll need...

- Docker

If going with a local PHP installation, you'll need (Mac-centric instructions to follow):

- Homebrew PHP

```
$ brew install php@7.1
$ echo 'export PATH="/usr/local/opt/php@7.1/bin:$PATH"' >> ~/.bash_profile
```

- [Composer](https://getcomposer.org/)

```
$ brew install composer
$ # Add it to your path...
$ echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bash_profile
$ source ~/.bash_profile
```

- [Laravel Valet](https://laravel.com/docs/5.8/valet)

```
$ composer global require laravel/valet
$ valet install
$ valet start
```

- [NodeJS](https://nodejs.org/en/download/) + [yarn](https://yarnpkg.com/lang/en/docs/install/)

```
$ brew install yarn # will also installed node if needed
```

## Quickstart

If using Docker:

```
$ sh dev.sh build
$ sh dev.sh up
```

The site will be available at [localhost:8000](http://localhost:8000).

If running locally:

```
$ sh infrastructure/valet-link.sh
$ sh yarn.sh install
$ sh yarn.sh start
```

The site will be available at [statamic.test](http://statamic.test).
