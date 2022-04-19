import 'package:flutter/material.dart';

enum Language { russian, english, deutsch, italian, french }

/* MoviePrimitive class
 * @constructor
 */
abstract class MoviePrimitive {
  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;

  MoviePrimitive(this.id, this.title, this.picture, this.voteAverage,
      this.releaseDate, this.description, this.language);
}

/* Movie class
 * @method display - Output movie info
 * @constructor
 */
class Movie extends MoviePrimitive with LangConvertation {
  Movie(id, title, picture, voteAverage, releaseDate, description, language)
      : super(id, title, picture, voteAverage, releaseDate, description,
            language) {
    convert(language);
  }

  void display() {
    print(
        "--- \n Id: $id \n Title: $title \n Picture: $picture \n Rating: $voteAverage \n Release Date: $releaseDate \n Description: $description \n Language: $language \n ---");
  }
}

/* LangConvertation - mixin
 * @method convert - String to enum
 *    @param {String} language
 */
mixin LangConvertation {
  Language lang;

  convert(String language) {
    switch (language) {
      case 'ru':
        lang = Language.russian;
        break;
      case 'en':
        lang = Language.english;
        break;
      case 'de':
        lang = Language.deutsch;
        break;
      case 'it':
        lang = Language.italian;
        break;
      case 'fr':
        lang = Language.french;
        break;
    }
  }
}

/* MyLanguage - extention on Language
 * @method toPrettyString - output language
 *    @param {Language} lang
 */
extension MyLanguage on Language {
  void toPrettyString(Language lang) {
    switch (lang) {
      case Language.russian:
        print('Русский');
        break;
      case Language.english:
        print('Английский');
        break;
      case Language.deutsch:
        print('Немецкий');
        break;
      case Language.italian:
        print('Итальянский');
        break;
      case Language.french:
        print('Французский');
        break;
    }
  }
}

/* listPrintFunc - Output list
 * @param {List} listMovies
 */
Future<void> listPrintFunc(List listMovies) async {
  for (var item in listMovies) {
    item.display();
  }
}

/* filterByRatingFunc - Filter by Rating
 * @param {double} rating
 * @param {List} listMovies
 * @returns {List} filteredList
 */
filterByRatingFunc(double rating, List listMovies) {
  List filtedList = [];
  for (var item in listMovies) {
    if (item.voteAverage >= rating) {
      filtedList.add(item);
    }
    ;
  }

  return filtedList;
}

void main() {
  Movie movieExample = Movie(
      'mv_001',
      'The Green Mile',
      'https://avatars.mds.yandex.net/get-kinopoisk-image/1599028/4057c4b8-8208-4a04-b169-26b0661453e3/600x900',
      9.1,
      '1999',
      'The Green Mile',
      'en');
  List movies = [
    Movie(
        'mv_001',
        'The Green Mile',
        'https://avatars.mds.yandex.net/get-kinopoisk-image/1599028/4057c4b8-8208-4a04-b169-26b0661453e3/600x900',
        9.1,
        '1999',
        'The Green Mile',
        'en'),
    Movie(
        'mv_002',
        'Intouchables',
        'https://avatars.mds.yandex.net/get-kinopoisk-image/1946459/bf93b465-1189-4155-9dd1-cb9fb5cb1bb5/600x900',
        8.8,
        '2011',
        'Friendship between the wealthy aristocrat Philip and the local resident Driss',
        'fr'),
    Movie(
        'mv_003',
        'Interstellar',
        'https://avatars.mds.yandex.net/get-kinopoisk-image/1600647/430042eb-ee69-4818-aed0-a312400a26bf/600x900',
        8.7,
        '2014',
        'A team of researchers and scientists is sent on a journey to a planet with suitable conditions for humanity',
        'en'),
    Movie(
        'mv_004',
        'Knockin\' on Heaven\'s Door',
        'https://avatars.mds.yandex.net/get-kinopoisk-image/1773646/aac37c55-3aa2-4f4d-b3ed-9f59ba426f92/600x900',
        8.6,
        '1997',
        'Fate brings two strangers together in a hospital where they receive fatal diagnoses',
        'de'),
    Movie(
        'mv_005',
        'Вампиры средней полосы',
        'https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/d71d666d-d95c-4f07-be15-9331aaa1ed1b/600x900',
        8.2,
        '2021',
        'Смоленск. Много веков тут живут вампиры, которые хоть и позволяют себе охотиться на людей, но всё же свято чтут договор',
        'ru'),
  ];
  List moviesFilteredByRating = [];
  Language langExample;

  //Output movie info and production language
  movieExample.display();
  langExample.toPrettyString(movieExample.lang);

  //Output movies list
  listPrintFunc(movies);

  //Output filtered movies with a rating >= 8.8
  print('\n Filtered moves: \n');
  moviesFilteredByRating = filterByRatingFunc(8.8, movies);
  listPrintFunc(moviesFilteredByRating);
}
