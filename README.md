# Contaodock

A Docker container for a modern Contao `4.4.* (LTS)` development workflow.

Includes the [Contao Manager](https://docs.contao.org/books/manager/de/installation-manager.html) and [Rock Solid Custom Elements](https://rocksolidthemes.com/de/contao/plugins/custom-content-elements) plugins.

*Use for development environment only!*

## Usage

`$ docker pull nikolaigulatz/contadock`

## Example Usage

1. Create a directory where your MySQL volume data will be stored:
   * `$ mkdir -p .docker/mysql && echo '.docker' >> .gitignore`
1. Create an initial file structure for your Contao app:
   * `$ mkdir -p app/templates app/files app/app/config app/system/config`
1. Start the Contao and MySQL containers using the `docker-compose.yml` located in `examples/`:
   * `$ docker-compose -f /path/to/docker-compose.yml up`
1. Create a database:
   * `$ echo 'CREATE DATABASE contao' | mysql -h 127.0.0.1 -uroot -proot`
1. Go to `http://localhost:3000/contao/install` and run the install tool.
