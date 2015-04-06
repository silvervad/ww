//google.load('visualization', '1.0', {'packages':['corechart']});
  
// Set a callback to run when the Google Visualization API is loaded.
google.setOnLoadCallback(drawCharts);

function drawCharts() {
  
  // Set chart options
  var options = {
    //backgroundColor: $("body").css("background-color"),
    backgroundColor: {
      'fill': 'transparent'
    },
    chartArea: {
      left: 0,
      top: 0,
      width: '100%',
      //height:'90%'
    },
    bar: {
      groupWidth: "80%"
    },
    legend: {
      position: 'none'
    },
    
    vAxis: {
      textStyle: {
        fontSize: 1
      },
      viewWindow: {
        max: 3,
        min: 0
      },
      gridlines: {
        count: 0,
      }
    },
    
    hAxis: {
      textStyle: {
        fontSize: 8,
        color: $(".sports").css("color")
      },

    },
    
    focusTarget: 'category',
    
    tooltip: {
      showColorCode: false,
      //isHtml: true
    }

  },
  data = [];
  

  for (i = 1; i < gon.seasons.length; i++) {
    
    // draw only for existing sports
    
    if (gon.seasons[i]) {
  
      data[i]=google.visualization.arrayToDataTable(gon.seasons[i]);
      //var div_name = 'chart_div' + i.toString();
      //console.log (div_name, i, gon.seasons.length);
    
        // Instantiate and draw our chart, passing in some options.
      //var chart = new google.charts.Bar(document.getElementById('chart-div' + i.toString()));
      var chart = new google.visualization.ColumnChart(document.getElementById('chart-div' + i.toString()));
      //chart.draw(data[i], google.charts.Bar.convertOptions(options));
  
      chart.draw(data[i], options);
    }

  }
  

    
}