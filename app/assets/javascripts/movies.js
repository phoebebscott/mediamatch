var mediamatchApp = angular.module('mediamatch-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

mediamatchApp.factory('User', ['$resource', function($resource) {
  return $resource('/users/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

mediamatchApp.factory('Movie', ['$resource', function($resource) {
  return $resource('/movies/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}]);

mediamatchApp.factory('rating', ['$resource', function($resource) {
  return $resource('/ratings/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}]);

mediamatchApp.controller('MovieCtrl', ['$scope', 'User', 'Movie', 'Rating', function($scope, Movie, Rating) {
  $scope.users= [];
  $scope.movies= [];
  $scope.ratings= [];

  $scope.newRating = new Rating();
  $scope.newMovie = new Movie();

  User.get(function(users) {
      $scope.users = users;
   });

  Movie.query(function(movies) {
    $scope.movies = movies;
  });

  Rating.query(function(ratings) {
    $scope.ratings = ratings;
  });

    $scope.saveRating = function() {
      $scope.newRating.$save(function(rating) {
        console.log(rating);
        $scope.ratings.push(rating);
        $scope.newRating = new Rating();
      });
    };

    $scope.saveMovie = function (movie, rating) {
      console.log(rating);
      // var price = parseFloat(product.priceLabel);
      // var salePrice = parseFloat(product.salePriceLabel);
      $scope.newMovie = new Movie({
        title: movie.title,
        poster: movie.poster.profile,
        rating_value: rating.value
      });
      console.log($scope.newProduct);

      $scope.newMovie.$save(function(movie) {
        $scope.movies.push(movie);
        $scope.newMovie = new Movie();
        Rating.query(function(ratings) {
          $scope.ratings = ratings;

       });

      });
    };

    $scope.search = function(movieSearch) {
      Movie.query({ search: movieSearch }, function(movies) {
        $scope.movies = movies;

      });
    };
}])

