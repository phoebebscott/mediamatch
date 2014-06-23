var mediamatchApp = angular.module('mediamatch-app', ['ngResource']).config(
    ['$httpProvider', function($httpProvider) {
    var authToken = angular.element("meta[name=\"csrf-token\"]").attr("content");
    var defaults = $httpProvider.defaults.headers;

    defaults.common["X-CSRF-TOKEN"] = authToken;
    defaults.patch = defaults.patch || {};
    defaults.patch['Content-Type'] = 'application/json';
    defaults.common['Accept'] = 'application/json';
}]);

mediamatchApp.factory('movie', ['$resource', function($resource) {
  return $resource('/movie/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}]);

mediamatchApp.controller('MovieCtrl', ['$scope', 'Movie', 'Rating', function($scope, Movie, Rating) {
  $scope.movies= [];

  Movie.query(function(movies) {
    $scope.movies = movies;
  });
}])

mediamatchApp.factory('rating', ['$resource', function($resource) {
  return $resource('/rating/:id',
    {id: '@id'},
    {update: { method: 'PATCH'}});
}])