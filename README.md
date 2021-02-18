# Database migration & rollback

Two simple bash scripts for migrating the database to a new state and rolling it back to its initial state.

## Requirements
* [psql](https://www.postgresql.org/download/)
* Linux distro or MacOS

## Installation

Use the following commands to download and set up the scripts:
```
git clone https://github.com/ADA-GWU/a1-db-migration-ismayilkarimli.git $HOME/a1-db-migration-ismayilkarimli
chmod 755 $HOME/a1-db-migration-ismayilkarimli/*
```

## Usage
Migration script:
```bash
$HOME/a1-db-migration-ismayilkarimli/migration.sh [database name]
```
Rollback script:
```bash
$HOME/a1-db-migration-ismayilkarimli/rollback.sh [database name]
```
### Example:
```bash
$HOME/a1-db-migration-ismayilkarimli/migration.sh assignment01
```
