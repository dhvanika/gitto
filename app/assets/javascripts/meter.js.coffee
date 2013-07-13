$(document).ready ->

  magic_number = $("#chart3").data("number")

  get_array = (number) ->
    [['a',number], ['b',100 - number]]

  # plot drawing function
  draw_plot = (array) ->
    plot = $.jqplot 'chart3', [array], {
      seriesDefaults:
        seriesColors: ['orange', 'white'],
        highlightColors: ['orange', 'white']
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

  percentage = 2

  # draw_plot get_array(magic_number)

  upInterval = setInterval( ->
    draw_plot get_array(percentage)
    percentage = percentage + 0.5
    if percentage > 100
      clearInterval(upInterval)
      # drawDownToValue()
  , 10)

  # drawDownToValue = ->
  #   upInterval = setInterval( ->
  #     draw_plot get_array(percentage)
  #     if percentage == 100
  #       clearInterval(interval)
  #       drawDownToValue()
  #   , 250)


