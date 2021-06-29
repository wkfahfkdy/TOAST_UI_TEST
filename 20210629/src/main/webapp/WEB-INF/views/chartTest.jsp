<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tui Chart</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
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
		  chart: { width: 700, height: 400 },
		};

		const barChart = chart.lineChart({ el, data, options });
		// 또는 아래의 것
		// const chart = new BarChart({ el, data, options });
		
	});
</script>
</head>
<body>
	<div align="center">
		<div>
			<h1>TOAST UI - Chart</h1>
		</div>
		<div id = "chart"></div>
	</div>
</body>

</html>