//= require jquery
// RailsAjax
//= require jquery.history
//= require jquery.rails-ajax
//= require RailsAjax-Config
//= require underscore

$(document).ready(function(){

  var giphyObject = {
    names: [],
    images: []
  };

  _.templateSettings = {
    interpolate: /\{\{\=(.+?)\}\}/g,
    evaluate: /\{\{(.+?)\}\}/g
  };

  var results = $('#giphy_results');
  var gipgy_submit = $('.giphy_form input[type="submit"]');
  var giphySection = $('section');

  gipgy_submit.on('click', function(){

    var input = $('form input[name="q"]').val();
    var number = $('form input[name="number"]').val();

    $.post({
      url: "/giphy",
      data: {input: input, number: number}
    })
    .done(function(data) {

      giphyObject.names = new Array;
      giphyObject.images = new Array;

      $.each(data, function(i, el){
        giphyObject.names.push(el.title);
        var test = {
          "img": el.images.looping.mp4,
          "title": el.title,
          "id": el.id,
        }
        giphyObject.images.push(test);
      })
      console.log(giphyObject);

      var template = _.template($('#myTemplate').html());
      results.html(template(giphyObject));

      results.html(template(giphyObject));

      giphySlider();
      saveGipgy();
      giphySection.css('display', 'block');
    });
    return false;
  });

  function giphySlider(){
    var allGiphyTitles = results.find('h1');
    var allGiphyImages = results.find('video');
    var index = 0

    console.log(allGiphyImages, ' images');

    $(allGiphyImages[index]).addClass('active');
    $(allGiphyTitles[index]).addClass('active');

    $('.right-arrow').on('click', function(){
      $(allGiphyTitles[index]).removeClass('active');
      $(allGiphyImages[index]).removeClass('active');

      if(index + 1 >= allGiphyTitles.length) {
        index = 0;
      }else {
        index ++;
      }
      $(allGiphyTitles[index]).addClass('active');
      $(allGiphyImages[index]).addClass('active');
    });

    $('.left-arrow').on('click', function(){
      $(allGiphyTitles[index]).removeClass('active');
      $(allGiphyImages[index]).removeClass('active');

      if(index - 1 < 0) {
        index = allGiphyTitles.length - 1;
      }else {
        index --;
      }
      $(allGiphyTitles[index]).addClass('active');
      $(allGiphyImages[index]).addClass('active');
    });
  }

  function saveGipgy() {
    results.find('video').on('click', function() {

      var saveImage = $(this).find('source').attr('src');
      var saveTitle = $(this).find('source').data('title');
      var saveId = $(this).find('source').attr('id');

      var saveData = {
        "image": saveImage,
        "title": saveTitle,
        "id": saveId,

      }

      $.ajax({
        url: "/save",
        data: saveData,
        type: 'POST',
      })
    })
  }

})
