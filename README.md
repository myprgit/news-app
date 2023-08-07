
# news-app



## Run Locally

Clone the project

```bash
  git clone https://github.com/myprgit/news-app.git
```

Go to the project directory

```bash
  cd news-app
```

Copy .env.example to .env

```bash
  cp .env.example .env
```


Install dependencies

```bash
docker run --rm \
    -u "$(id -u):$(id -g)" \
    -v $(pwd):/var/www/html \
    -w /var/www/html \
    laravelsail/php81-composer:latest \
    composer install --ignore-platform-reqs
```

Start Docker

```bash
  ./vendor/bin/sail up
```

Import the provided news_app.sql file to a database called 'news_app'
you may use ```localhost:8080``` for phpmyadmin

Install node dependencies
```bash
  ./vendor/bin/sail npm install
```
Start the server
```bash
  ./vendor/bin/sail npm run dev
```
