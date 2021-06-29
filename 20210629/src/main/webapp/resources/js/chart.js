	$(document).ready(function(){
		
		// barChart
		const chart = toastui.Chart;
		
		const el = document.getElementById('chart');
		const data = {
		  categories: ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
		  series: [
		    {
		      name: 'Budget',
		      data: [5000, 3000, 5000, 7000, 6000, 4000, 1000],
		    },
		    {
		      name: 'Income',
		      data: [8000, 4000, 7000, 2000, 6000, 3000, 5000],
		    },
		    {
			      name: 'ㅁㄹ',
			      data: [6000, 2000, 3000, 4000, 2000, 3000, 5000],
			}
		  ],
		};
		const options = {
		  chart: { width: 700, height: 400 }
		};

		const barChart = chart.barChart({ el, data, options });
		// 또는 아래의 것
		// const chart = new BarChart({ el, data, options });
		
		
		
	});
	
	$(document).ready(function(){
		
		const chart = toastui.Chart;
		
		// lineAreaChart
		const el = document.getElementById('Areachart');
		
		const data = {
				  categories: [
				    '2020.01',
				    '2020.02',
				    '2020.03',
				    '2020.04',
				    '2020.05',
				    '2020.06',
				    '2020.07',
				    '2020.08',
				    '2020.09',
				    '2020.10',
				    '2020.11',
				    '2020.12'
				  ],
				  series: {
					    area: [{
					        name: 'Effective Load',
					        data: [150, 130, 100, 125, 128, 44, 66, 162, 77, 70, 68, 103]
					      }],
					    line: [{
					        name: 'Power Usage',
					        data: [72, 80, 110, 117, 129, 137, 134, 66, 121, 88, 114, 117]
					      }]
				  }
		}
		const options = {
				  chart: { width: 700, height: 400 },
				  series: {
					    showDot: true,
					    line: {
					      spline: true
					    },
					    area: {
					      dataLabels: {
					        visible: true
					      }
					    }
				  }
				};
		
		const lineChart = chart.lineAreaChart({ el, data, options });
		
	});