<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅅㅂ이거안됨</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
import colorLib from '@kurkle/color';
import {DateTime} from 'luxon';
import 'chartjs-adapter-luxon';
import {valueOrDefault} from '../../dist/helpers.esm';

// Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/
var _seed = Date.now();

export function srand(seed) {
  _seed = seed;
}

export function rand(min, max) {
  min = valueOrDefault(min, 0);
  max = valueOrDefault(max, 0);
  _seed = (_seed * 9301 + 49297) % 233280;
  return min + (_seed / 233280) * (max - min);
}

export function numbers(config) {
  var cfg = config || {};
  var min = valueOrDefault(cfg.min, 0);
  var max = valueOrDefault(cfg.max, 100);
  var from = valueOrDefault(cfg.from, []);
  var count = valueOrDefault(cfg.count, 8);
  var decimals = valueOrDefault(cfg.decimals, 8);
  var continuity = valueOrDefault(cfg.continuity, 1);
  var dfactor = Math.pow(10, decimals) || 0;
  var data = [];
  var i, value;

  for (i = 0; i < count; ++i) {
    value = (from[i] || 0) + this.rand(min, max);
    if (this.rand() <= continuity) {
      data.push(Math.round(dfactor * value) / dfactor);
    } else {
      data.push(null);
    }
  }

  return data;
}

export function points(config) {
  const xs = this.numbers(config);
  const ys = this.numbers(config);
  return xs.map((x, i) => ({x, y: ys[i]}));
}

export function bubbles(config) {
  return this.points(config).map(pt => {
    pt.r = this.rand(config.rmin, config.rmax);
    return pt;
  });
}

export function labels(config) {
  var cfg = config || {};
  var min = cfg.min || 0;
  var max = cfg.max || 100;
  var count = cfg.count || 8;
  var step = (max - min) / count;
  var decimals = cfg.decimals || 8;
  var dfactor = Math.pow(10, decimals) || 0;
  var prefix = cfg.prefix || '';
  var values = [];
  var i;

  for (i = min; i < max; i += step) {
    values.push(prefix + Math.round(dfactor * i) / dfactor);
  }

  return values;
}

const MONTHS = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

export function months(config) {
  var cfg = config || {};
  var count = cfg.count || 12;
  var section = cfg.section;
  var values = [];
  var i, value;

  for (i = 0; i < count; ++i) {
    value = MONTHS[Math.ceil(i) % 12];
    values.push(value.substring(0, section));
  }

  return values;
}

const COLORS = [
  '#4dc9f6',
  '#f67019',
  '#f53794',
  '#537bc4',
  '#acc236',
  '#166a8f',
  '#00a950',
  '#58595b',
  '#8549ba'
];

export function color(index) {
  return COLORS[index % COLORS.length];
}

export function transparentize(value, opacity) {
  var alpha = opacity === undefined ? 0.5 : 1 - opacity;
  return colorLib(value).alpha(alpha).rgbString();
}

export const CHART_COLORS = {
  red: 'rgb(255, 99, 132)',
  orange: 'rgb(255, 159, 64)',
  yellow: 'rgb(255, 205, 86)',
  green: 'rgb(75, 192, 192)',
  blue: 'rgb(54, 162, 235)',
  purple: 'rgb(153, 102, 255)',
  grey: 'rgb(201, 203, 207)'
};

const NAMED_COLORS = [
  CHART_COLORS.red,
  CHART_COLORS.orange,
  CHART_COLORS.yellow,
  CHART_COLORS.green,
  CHART_COLORS.blue,
  CHART_COLORS.purple,
  CHART_COLORS.grey,
];

export function namedColor(index) {
  return NAMED_COLORS[index % NAMED_COLORS.length];
}

export function newDate(days) {
  return DateTime.now().plus({days}).toJSDate();
}

export function newDateString(days) {
  return DateTime.now().plus({days}).toISO();
}

export function parseISODate(str) {
  return DateTime.fromISO(str);
}
</script>
<script>
	
	const DATA_COUNT = 7;
	const NUMBER_CFG = {count: DATA_COUNT, min: -100, max: 100};
	
	const labels = Utils.months({count: 7});
	const data = {
	  labels: labels,
	  datasets: [
	    {
	      label: 'Dataset 1',
	      data: Utils.numbers(NUMBER_CFG),
	      borderColor: Utils.CHART_COLORS.red,
	      backgroundColor: Utils.transparentize(Utils.CHART_COLORS.red, 0.5),
	    },
	    {
	      label: 'Dataset 2',
	      data: Utils.numbers(NUMBER_CFG),
	      borderColor: Utils.CHART_COLORS.blue,
	      backgroundColor: Utils.transparentize(Utils.CHART_COLORS.blue, 0.5),
	    }
	  ]
	};
	
	const config = {
			  type: 'bar',
			  data: data,
			  options: {
			    indexAxis: 'y',
			    // Elements options apply to all of the options unless overridden in a dataset
			    // In this case, we are setting the border of each horizontal bar to be 2px wide
			    elements: {
			      bar: {
			        borderWidth: 2,
			      }
			    },
			    responsive: true,
			    plugins: {
			      legend: {
			        position: 'right',
			      },
			      title: {
			        display: true,
			        text: 'Chart.js Horizontal Bar Chart'
			      }
			    }
			  },
	};
	
	// === include 'setup' then 'config' above ===
	
	var myChart = new Chart(
	  document.getElementById('myChart'),
	  config
	);
</script>
</head>
<body>
	<div>
	<canvas id = "myChart"></canvas>
	</div>
	<script>
		const actions = [
			  {
			    name: 'Randomize',
			    handler(chart) {
			      chart.data.datasets.forEach(dataset => {
			        dataset.data = Utils.numbers({count: chart.data.labels.length, min: -100, max: 100});
			      });
			      chart.update();
			    }
			  },
			  {
			    name: 'Add Dataset',
			    handler(chart) {
			      const data = chart.data;
			      const dsColor = Utils.namedColor(chart.data.datasets.length);
			      const newDataset = {
			        label: 'Dataset ' + (data.datasets.length + 1),
			        backgroundColor: Utils.transparentize(dsColor, 0.5),
			        borderColor: dsColor,
			        borderWidth: 1,
			        data: Utils.numbers({count: data.labels.length, min: -100, max: 100}),
			      };
			      chart.data.datasets.push(newDataset);
			      chart.update();
			    }
			  },
			  {
			    name: 'Add Data',
			    handler(chart) {
			      const data = chart.data;
			      if (data.datasets.length > 0) {
			        data.labels = Utils.months({count: data.labels.length + 1});
	
			        for (var index = 0; index < data.datasets.length; ++index) {
			          data.datasets[index].data.push(Utils.rand(-100, 100));
			        }
	
			        chart.update();
			      }
			    }
			  },
			  {
			    name: 'Remove Dataset',
			    handler(chart) {
			      chart.data.datasets.pop();
			      chart.update();
			    }
			  },
			  {
			    name: 'Remove Data',
			    handler(chart) {
			      chart.data.labels.splice(-1, 1); // remove the label first
	
			      chart.data.datasets.forEach(dataset => {
			        dataset.data.pop();
			      });
	
			      chart.update();
			    }
			  }
		];
	</script>
	<script>

</script>
</body>
</html>