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
end
