angular.module 'imageDirectives', []
  .directive 'imagesNavbar', ->
    restrict: 'E'
    replace: 'true'
    templateUrl: 'views/angular/imageNavbar.html'
  .directive 'imagesFooter', ->
    restrict: 'E'
    replace: 'true'
    templateUrl: 'views/angular/imagesFooter.html'
  .directive 'images', ->
    restrict: 'E'
    replace: 'true'
    templateUrl: 'views/angular/images.html'
  .directive 'uploader', ['$timeout', (timer) ->
    restrict: 'E'
    replace: 'true'
    templateUrl: 'views/angular/imagesUploader.html'
    link: (scope, elem, attrs) ->
      jumbotron = elem.get(0)
      startAll = elem.find(".start")
      previews = elem.find("#previews")
      totalProgress = elem.find("#total-progress")
      progressBar = elem.find("#total-progress .progress-bar")
      previewNode = elem.find("#template").get(0)
      previewTemplate = previewNode.parentNode.innerHTML
      previewNode.id = ""
      previewNode.parentNode.removeChild previewNode

      myDropzone = new Dropzone(jumbotron,
        url: "/upload"
        thumbnailWidth: 80
        thumbnailHeight: 80
        parallelUploads: 20
        previewTemplate: previewTemplate
        autoProcessQueue: false
        previewsContainer: "#previews"
        clickable: [
          ".jumbotron"
          ".fileinput-button"
        ]
        acceptedFiles: "image/*, .jpg, .jpeg, .gif, .png"
        maxFilesize: 2
      )

      myDropzone.on "addedfile", (file) ->
        startAll.removeAttr "disabled"
        $(file.previewElement).find(".start-single").on "click", ->
          myDropzone.processFile file
          return

        return

      myDropzone.on "removedfile", (file) ->

        # if there's no files in the preview box now, then disable the upload all button
        startAll.attr "disabled", "disabled"  if previews.children().length < 1
        return

      myDropzone.on "uploadprogress", (file, progress) ->
        progressBar.css "width", progress + "%"
        return

      myDropzone.on "sending", (file) ->

        totalProgress.css "opacity", "1"
        $(file.previewElement).find(".start-single").attr "disabled", "disabled"
        return

      myDropzone.on "queuecomplete", (progress) ->
        startAll.attr "disabled", "disabled"
        totalProgress.css "opacity", "0"
        return

      myDropzone.on "success", (file, image) ->
        scope.images.unshift image

        #trigger animations to hide the file row and the total progress bar
        timer (->
          $(file.previewElement).fadeOut "slow"
          return
        ), 2000

        #only reset the width once the bar is completely hidden to avoid jarring visuals
        totalProgress.fadeOut 400, ->
          progressBar.css "width", "0%"
          return

        return

      startAll.on "click", ->
        myDropzone.processQueue myDropzone.getQueuedFiles()
        return
  ]