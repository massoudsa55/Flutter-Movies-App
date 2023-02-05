import 'package:flutter_movies_app/domain/entities/genres.dart';

import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/recommendation.dart';

MovieDetails movieDetailsDummy = const MovieDetails(
  id: 505642,
  backdropPath: "/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
  genres: [
    Genres(id: 12, name: "Adventure"),
    Genres(id: 28, name: "Action"),
  ],
  title: "Black Panther: Wakanda Forever",
  overView:
      "Queen Ramonda, Shuri, M’Baku, Okoye and the Dora Milaje fight to protect their nation from intervening world powers in the wake of King T’Challa’s death.  As the Wakandans strive to embrace their next chapter, the heroes must band together with the help of War Dog Nakia and Everett Ross and forge a new path for the kingdom of Wakanda.",
  runTime: 139,
  releaseDate: "2022-11-09",
  voteAverage: 7.515,
);

List<Recommendations> recommendationsDummy = const [
  Recommendations(id: 436270, backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg"),
  Recommendations(id: 829280, backdropPath: "/n2OaA7Je0fgcVnfJM7xDJoPny7x.jpg"),
  Recommendations(id: 76600, backdropPath: "/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg"),
  Recommendations(id: 56969, backdropPath: "/w1mBhslq3Fx5n9RV331ySlsWBzM.jpg"),
  Recommendations(id: 312634, backdropPath: "/18LJeXjNNZSplL2CSlGV5Qmi1TP.jpg"),
  Recommendations(id: 899112, backdropPath: "/sBOenwOZGRN5nZZGw4TxwtnfrEf.jpg"),
  Recommendations(id: 238, backdropPath: "/tmU7GeKVybMWFButWEGl2M4GeiP.jpg"),
  Recommendations(id: 551271, backdropPath: "/maxRhndtC4BJABvqRPvYNu69CHA.jpg"),
  Recommendations(id: 22023, backdropPath: "/yzc8oGmkfV8niSv33bk34iJ0nId.jpg"),
  Recommendations(id: 736526, backdropPath: "/53BC9F2tpZnsGno2cLhzvGprDYS.jpg"),
];
