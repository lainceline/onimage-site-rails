angular.module('imageControllers', [])
.controller 'ImageController', ($scope, $http) ->

  $scope.images = []
  imagePromise = $http.get '/images'

  imagePromise
  .success (data, status, headers, config) ->
    $scope.images = data
  .error (data, status, headers, config) ->
    console.log(status)
