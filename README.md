<p align="center">
  <img src="https://user-images.githubusercontent.com/7834279/213662295-b7ada1bd-f44e-499b-9847-15fbb388d5ae.png">
</p>

# 🎬🔍 Movie Search: a search engine for movies

**Movie Search** is a over-engineered (on purpose 😅) search engine built with **Ruby on Rails**, with a real-time search-box made with **HotWire** and results being presented with **Elasticsearch**. **Redis** is heavily utilized for scalability and the analytics algorithm, while **Sidekiq** is used for background processing using cron tasks. **Tailwind** was the choice for the design. To deploy I chose **Dokku**.

<p align="center">
  <img src="https://user-images.githubusercontent.com/7834279/213665727-ddfeff56-f253-4f51-9e61-6f7ddceb0fb8.gif" width="581" height="446">
</p>

<p align="center">
  Demo: https://moviesearch.devanil.dev/
  I wrote a blog post about this project: https://devanil.dev/movie-search-project
</p>

## Versions

These are the versions used for this project:

```
Rails version: 7.0.4.1
Ruby version: 3.1.2
Redis version: 7.0.7
Sidekiq version: 6.5.8
Elasticsearch version: 7.16.3
```

## Installation

First, clone the project on your local machine:

```
git clone https://github.com/devaniljr/movie_search .
```

Install all dependencies running on the terminal inside the project folder:

```
bundle
```

Now setup the database:

```
bin/rails db:create db:migrate
```

It's important to seed the database to create some data for testing:

```
bin/rails db:seed
```

Run the project with:

```
bin/dev
```

While the project is running, run Sidekiq together:

```
bundle exec sidekiq
```

You will not be able to replicate deployed behavior until you install _Redis and Elasticsearch_. Please do not hesitate to contact me if you have any difficulties.

## Next steps

This was a 48-hour effort, so there is plenty of space for improvement. Here are some suggestions:

- [ ] Implement turbo-stream to update analytics sections in real-time as well.
- [ ] Improve analytics algorithm to deal with edge scenarios.
- [ ] Improve analytics layout, maybe making it more like Netflix?

---

You'll find me in:
- LinkedIn: https://www.linkedin.com/in/devaniljr/
- My blog: https://devanil.dev/
