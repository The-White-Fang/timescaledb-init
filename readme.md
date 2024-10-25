# How to

1. Create a copy of `example.env`. Rename it `.env.
2. Update `.env`.
3. Run `config/generate-cert.sh` to create certificate files.
4. Run `config/generate-userlist.sh` to update PGBouncer's user-list file. Add admin user specified in `.env` file with same password for management.
5. Run `docker-compose up -d` to run all containers.


## References
- [TimeScaleDB Docker](https://docs.timescale.com/self-hosted/latest/install/installation-docker)
- [PGBouncer Docker](https://github.com/edoburu/docker-pgbouncer)
- [PGBouncer Authentication](https://www.cybertec-postgresql.com/en/pgbouncer-authentication-made-easy/)
- [PGBouncer config (`pgbouncer.ini`)](https://www.pgbouncer.org/config.html)