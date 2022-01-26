class Movie {
  final int id, year;
  final double rating;
  final List<String> genre;
  final String plot, title, poster;
  final List<Map> cast;

  Movie({
    required this.poster,
    required this.title,
    required this.id,
    required this.year,
    required this.rating,
    required this.genre,
    required this.plot,
    required this.cast,
  });
}

// our demo data movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "Bloodshot",
    year: 2020,
    poster: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc0D49rZ7jM7BNrOi7GSZ9o7vvpWy5FMw2gA&usqp=CAU",
    rating: 7.3,
    genre: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ],
  ),
  Movie(
    id: 2,
    title: "Ford v Ferrari ",
    year: 2019,
    poster: "https://avatars.mds.yandex.net/get-kinopoisk-image/1898899/211e880d-c183-43aa-83b0-13c08109eaf7/600x900",
    rating: 8.2,
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ], genre: ["Action", "Drama"],
  ),
  Movie(
    id: 3,
    title: "Red Notice",
    year: 2021,
    poster: "https://upload.wikimedia.org/wikipedia/ru/b/b8/%D0%9A%D1%80%D0%B0%D1%81%D0%BD%D0%BE%D0%B5_%D1%83%D0%B2%D0%B5%D0%B4%D0%BE%D0%BC%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5.jpg",
    rating: 6.5,
    genre: ["Action", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ],
  ),
  Movie(
    id: 4,
    title: "Spirited Away",
    year: 2001,
    poster: "https://m.media-amazon.com/images/M/MV5BMjlmZmI5MDctNDE2YS00YWE0LWE5ZWItZDBhYWQ0NTcxNWRhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg",
    rating: 9.9,
    genre: ["Anime", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ],
  ),
  Movie(
    id: 5,
    title: "My Neighbor Totoro",
    year: 1988,
    poster: "https://blog.vsemayki.ru/wp-content/uploads/2019/11/%D1%81%D0%B5%D0%BE_%D1%81%D1%82%D0%B0%D1%82%D1%8C%D0%B8_%D0%B1%D0%BB%D0%BE%D0%B3_%D0%B2%D0%BA_%D0%B2%D1%81%D0%B5_1280%D1%85800_3-%D0%BE%D0%B1%D0%BB-1024x640.jpg",
    rating: 9.9,
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ], genre: ["Anime", "Drama"],
  ),
  Movie(
    id: 6,
    title: "Howl's Moving Castle",
    year: 2004,
    rating: 10.0,
    poster: "https://kinoafisha.ua/upload/films/371/237jynwyletayushchiy-zamok.jpeg",
    genre: ["Anime", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ],
  ),
  Movie(
    id: 7,
    title: "Castle in the Sky",
    year: 1986,
    poster: "https://tlum.ru/uploads/aa92d419f476ee308d1cdb6ac208c33fb6fac223015d7d0da601b91c7fb88f22.jpeg",
    rating: 9.3,
    genre: ["Anime", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ],
  ),
  Movie(
    id: 8,
    title: "Nausicaa of the Valley of Wind",
    year: 1984,
    poster: "https://upload.wikimedia.org/wikipedia/ru/thumb/0/09/Kaze_no_tani_no_Naushika.jpg/230px-Kaze_no_tani_no_Naushika.jpg",
    rating: 9.0,
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ], genre: ["Anime", "Drama"],
  ),
  Movie(
    id: 9,
    title: "Mononoke Hime",
    year: 1997,
    poster: "https://upload.wikimedia.org/wikipedia/ru/3/38/Mononoke_Hime_DVD_Cover.jpg",
    rating: 8.9,
    genre: ["Anime", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ],
  ),
  Movie(
    id: 10,
    title: "Kiki's Delivery Service",
    year: 1989,
    poster: "https://upload.wikimedia.org/wikipedia/ru/thumb/0/07/Kiki%27s_Delivery_Service_%28Movie%29.jpg/200px-Kiki%27s_Delivery_Service_%28Movie%29.jpg",
    rating: 9.0,
    genre: ["Anime", "Drama"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ],
  ),
  Movie(
    id: 12,
    title: "Onward",
    year: 2020,
    poster: "https://meedia.apollo.ee/media/catalog/product/cache/2/image/17f82f742ffe127f42dca9de82fb58b1/8/7/8717418570828.jpg",
    rating: 7.6,
    genre: ["Action", "Drama","Comedy"],
    plot: plotText,
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "https://thumbs.dfs.ivi.ru/storage6/contents/3/3/e85ff01fe262a0a332e2c49eb4782d.jpg",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "https://upload.wikimedia.org/wikipedia/commons/8/82/Damon_cropped.jpg",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "https://m.media-amazon.com/images/M/MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA@@._V1_.jpg",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "https://stuki-druki.com/biofoto4/caitriona-balfe-01.jpg",
      },
    ],
  ),
];

String plotText =
    "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";
