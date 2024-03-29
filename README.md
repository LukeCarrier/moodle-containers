# Moodle containers

`docker-compose` will run containers for:

- nginx at [`localhost:8080`](http://localhost:8080/)
- PHP-FPM (8.2, 8.0, 7.4, 7.2 or 7.0; with or without Xdebug)
- MSSQL Server on `localhost:11433`
- Redis on `localhost:6379`
- ClamAV
- Selenium Grid at [`localhost:4444`](http://localhost:4444/) with two nodes:
  - Chrome
  - Firefox

## Getting started

1. Clone this repository to `/_docker` inside of your Moodle installation.
2. Optionally, authenticate with the GitHub container registry: `podman login --username lukecarrier ghcr.io`.
3. Copy the appropriate `docker-compose.yml` file from inside it to your Moodle directory. Check supported versions in the Moodle release notes.
4. Bring up the containers with `docker-compose up`.
5. Copy the sample Moodle configuration with `cp _docker/moodle/config.php config.php`.

The final layout should look something like:

- `/Moodle`
  - `/_docker`
  - `/.env`
  - `/docker-compose.yml`

Ignore the files for the Docker environment in Git by appending the following entries to `.git/info/exclude`:

```text
/.env
/_docker
/docker-compose.yml
```

Ensure the data volume contains the requried directories:

```console
docker-compose run --entrypoint install --rm app \
  -d -o www-data -g www-data -m 750 /data/base /data/xdebug /data/base/phpunit /data/behat /data/behat-faildump
```

Install Moodle, over the CLI if you prefer:

```console
docker-compose run --entrypoint php --rm app \
  /app/admin/cli/install_database.php --agree-license --adminpass='P4$$word'
```

## Debugging

To enable debugging support via Xdebug:

1. Uncomment the appropriate environment variables in `.env`. You can check the Xdebug version used by each PHP version in the Makefile.
2. Edit `docker-compose.yml` such that the `app` service uses the `moodle-php-fpm-$version-dev` image in place of `moodle-php-fpm-$version`.
3. Configure your IDE to listen for Xdebug connections on port 9000, and set up path mapping for the Moodle directory to `/app` on the server.
