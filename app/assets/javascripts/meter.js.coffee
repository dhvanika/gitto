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

