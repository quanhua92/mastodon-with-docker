# mastodon-with-docker

## Getting Started

1. Copy `db/.env.db.sample` to `db/.env.db`. Replace database password.
2. Copy `es/.env.es.sample` to `es/.env.es`. Replace elastic search password.
3. Run DB & Redis & Elastic search. Skip if you use managed services from cloud provider.

    ```bash
    docker-compose -f ./mastodon/docker-compose.yml up -d db redis
    ```

4. Run `rake secret` twice to get two random secret.

    ```bash
    docker-compose -f ./mastodon/docker-compose.yml run --rm console bundle exec rake secret
    ```

5. Generate VAPID key for push notification.

    ```bash
    docker-compose -f ./mastodon/docker-compose.yml run --rm console bundle exec rake mastodon:webpush:generate_vapid_key
    ```

6. Copy `mastodon/.env.mastodon.sample` to `mastodon/.env.mastodon`. Fill in the information & above keys. Replace example.com with your domain. Fill in SMTP & S3 Object Storage info.
7. Run `rake db:setup` to setup database.

    ```bash
    docker-compose -f ./mastodon/docker-compose.yml run --rm console bundle exec rake db:setup
    ```

8. Run mastodon services

    ```bash
    docker-compose -f ./mastodon/docker-compose.yml up -d
    ```
