
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


Start Docker

```bash
  ./vendor/bin/sail up
```

Install dependencies

```bash
  ./vendor/bin/sail composer install
```

Install node dependencies

```bash
  ./vendor/bin/sail npm install
```

Start the server

```bash
  ./vendor/bin/sail npm run dev
```

