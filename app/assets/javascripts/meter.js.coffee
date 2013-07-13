$(document).ready ->

  magic_number = $("#chart3").data("number")

  get_array = (number) ->
    [['a',number], ['b',100 - number]]

  # plot drawing function
  draw_plot = (array) ->
    plot = $.jqplot 'chart3', [array], {
      seriesDefaults:
        seriesColors: ['#ed2024', '#eee'],
        highlightColors: ['#ed2024', '#eee']
        renderer:$.jqplot.DonutRenderer
        rendererOptions:
          startAngle: 90
          innerDiameter: 210
          thickness: 5
          dataLabels: 'value'
          shadow: false
      grid:
        drawBorder: false
        backgroundColor: 'white'
        shadow: false
    }

  draw_plot get_array(magic_number)

  $('ul#nav li a#menuIcon').click ->
    if($('div.container').hasClass("menuClosed"))
      $('div.container').animate({"margin-left": "240px"}, 200)
      $('div.container').removeClass("menuClosed")
      $('div.container').addClass("menuOpen")
    else if ($('div.container').hasClass("menuOpen"))
      $('div.container').animate({"margin-left": "0px"}, 200)
      $('div.container').removeClass("menuOpen")
      $('div.container').addClass("menuClosed")
