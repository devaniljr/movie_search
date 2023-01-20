module MovieHelper
    def random_poster
        ['/img/movie_poster_1.png', '/img/movie_poster_2.png',
        '/img/movie_poster_3.png', '/img/movie_poster_4.png',
        '/img/movie_poster_5.png', '/img/movie_poster_6.png',
        '/img/movie_poster_7.png'].sample
    end

    def find_movie(title)
        Movie.find_by(title: title)
    end

    def total_searches
        format_number(@redis.get("analytics:totalsearches"))
    end

    def month_searches
        time = Time.now
        month_key = "analytics:month:#{time.strftime("%m:%Y")}"

        format_number(@redis.get(month_key))
    end

    def year_searches
        time = Time.now
        year_key = "analytics:year:#{time.strftime("%Y")}"

        format_number(@redis.get(year_key))
    end

private

    def format_number(num)
        num = num.to_i
        if num > 1000
            "#{(num / 1000).round(1)}k"
        else
            num
        end
    end
end
