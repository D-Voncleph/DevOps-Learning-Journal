# Week 22 Summary: Building a Complete 3-Tier Application with Docker Compose

This week was the culmination of my Docker Compose learning, as I built and connected a full 3-tier FinTech application.

I started by learning how to incorporate a database service (PostgreSQL) into my `docker-compose.yml` file, focusing heavily on **data persistence** using Docker **named volumes**. I then learned the critical practice of managing sensitive configuration (like database passwords) using **environment variables** defined in a `.env` file, ensuring secrets are never hard-coded or committed to Git.

The core of the week involved extensive lab work:

1.  I added the `db` (Postgres) service to my `docker-compose.yml`, configured its environment variables from my `.env` file, and set up a named volume (`db-data`) for persistent storage.
2.  I then connected my `backend` (Flask) application to this new `db` service. This involved adding the database driver (`psycopg2-binary`) to my `requirements.txt`, passing the `DATABASE_URL` environment variable from `.env` to the `backend` container, and modifying my `app.py` to test the database connection.
3.  Finally, I completed the full 3-tier connection by configuring my `frontend` (Nginx) service to act as a **reverse proxy**. This involved creating a custom `nginx.conf` to forward API requests from `/api/` to my `backend` service over the internal Docker network. Crucially, I removed the public port mapping for the `backend` and `db` services, enhancing the application's security.

This week culminated in a fully functional, secure, and persistent 3-tier application, orchestrated with a single `docker compose up` command.

