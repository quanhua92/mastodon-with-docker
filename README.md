# mastodon-with-docker

## Getting Started

1. Copy `db/.env.db.sample` to `db/.env.db`. Replace database password.
2. Copy `es/.env.es.sample` to `es/.env.es`. Replace elastic search password.
3. Run DB & Redis & Elastic search. Skip if you use managed services from cloud provider.

    ```bash
    docker-compose -f ./db/docker-compose.yml -f ./redis/docker-compose.yml -f ./es/docker-compose.yml up -d
    ```

4. Exec into the database container to create a new table `mastodon`

    ```bash
    docker exec -it mastodon-db /bin/bash

    psql -h mastodon-db -U postgres
    CREATE DATABASE mastodon
    ```

5. Run `rake secret` twice to get two random secret.

    ```bash
    docker run -it tootsuite/mastodon bundle exec rake secret
    ```

6. Generate VAPID key for push notification.

    ```bash
    docker run -it tootsuite/mastodon bundle exec rake mastodon:webpush:generate_vapid_key
    ```

7. Copy `mastodon/.env.production.sample` to `mastodon/.env.production`. Fill in the information & above keys.
8. Run mastodon services

    ```bash
    docker-compose -f ./mastodon/docker-compose.yml up -d
    ```
