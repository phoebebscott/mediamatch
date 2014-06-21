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

mediamatchApp.factory('Rating', ['$resource', function($resource) {
  return $resource('/ratings/:id',
     {id: '@id'},
     {update: { method: 'PATCH'}});
}]);

mediamatchApp.controller('MediaController', ['$scope', 'User', 'Movie', 'Rating', function($scope, User, Movie, Rating) {

  $scope.users = [];
  $scope.movies = [];
  $scope.ratings = [];

  $scope.newRating = new Rating();
  $scope.newMovie = new Movie();

User.get(function(users) {
      $scope.users = users;
   });

Rating.query(function(ratings) {
      $scope.ratings = ratings;

   });

Movie.query(function(movies){
  $scope.movies = movies;

});

    $scope.rateMovie = function() {
      $scope.rateMovie.$save(function(rating) {
        console.log(rating);
        $scope.ratings.push(rating);
        $scope.rateMovie = new Rating();
      });
    };

    $scope.saveMovie = function (movie, rating) {
      console.log(rating);
      // var price = parseFloat(product.priceLabel);
      // var salePrice = parseFloat(product.salePriceLabel);
      $scope.saveMovie = new Movie({
        id: movie.id,
        title: movie.title,
        poster: movie.poster,
        score: movie.score,
      });
      console.log($scope.saveMovie);

      $scope.saveMovie.$save(function(movie) {
        $scope.movies.push(movie);
        $scope.newMovie = new Movie();
        List.query(function(lists) {
          $scope.lists = lists;

       });

      });
    };

    $scope.search = function(movieSearch) {
      console.log('hello Phoebe!');

      Search.query({ search: movieSearch }, function(movies) {
        $scope.movies = movies;

      });
    };

    $scope.movie = new Movie();

    $scope.oneAtATime = true;

    $scope.showDetails = false;

}]);

