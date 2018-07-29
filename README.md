# Contaodock

A Docker container for a modern Contao `4.5.* (LTS)` development workflow.

## Example usage

1. Create a directory where your MySQL volume data will be stored:
   * `$ mkdir -p .docker/mysql && echo '.docker' >> .gitignore`
1. Create an initial file structure for your Contao app:
   * `$ mkdir -p app/templates app/files app/app/config app/system/config`
1. Start the Contao and MySQL containers using the `docker-compose.yml` located in `examples/`:
   * `$ docker-compose -f /path/to/docker-compose.yml up`
1. Create a database
   * `$ echo 'CREATE DATABASE contao' | mysql -h 127.0.0.1 -uroot -proot`
1. Go to `http://localhost:3000/contao/install` and run the install tool
