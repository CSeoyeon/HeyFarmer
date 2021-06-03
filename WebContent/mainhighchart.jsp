<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>


	<link rel="stylesheet" href="css/mainhighcharts.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>
<body>
	<figure class="highcharts-figure">
    <div id="container"></div>
    <p class="highcharts-description">
    </p>
</figure>
	<div align="center" style="margin-top: 20px; margin-bottom: 20px"> 
	</div>

<script type="text/javascript">
Highcharts.chart('container', {
	  chart: {
	    type: 'packedbubble',
	    height: '100%'
	  },
	  title: {
	    text: '지금 가장 인기있는 농산물 (2020)'
	  },
	  tooltip: {
	    useHTML: true,
	    pointFormat: '<b>{point.name}:</b> {point.value}m CO<sub>2</sub>'
	  },
	  plotOptions: {
	    packedbubble: {
	      minSize: '30%',
	      maxSize: '120%',
	      zMin: 0,
	      zMax: 1000,
	      layoutAlgorithm: {
	        splitSeries: false,
	        gravitationalConstant: 0.02
	      },
	      dataLabels: {
	        enabled: true,
	        format: '{point.name}',
	        filter: {
	          property: 'y',
	          operator: '>',
	          value: 1
	        },
	        style: {
	          color: 'black',
	          textOutline: 'none',
	          fontWeight: 'normal'
	        }
	      }
	    }
	  },
	  series: [{
	    name: '과일류',
	    data: [{
	      name: '귤',
	      value: 767.1
	    }, {
	      name: '체리',
	      value: 20.7
	    },
	    {
	      name: "메론",
	      value: 97.2
	    },
	    {
	      name: "사과",
	      value: 111.7
	    },
	    {
	      name: "바나나",
	      value: 158.1
	    },
	    {
	      name: "방울토마토",
	      value: 241.6
	    },
	    {
	      name: "거봉",
	      value: 249.1
	    },
	    {
	      name: "홍시",
	      value: 298.1
	    },
	    {
	      name: "곶감",
	      value: 323.7
	    },
	    {
	      name: "수박",
	      value: 78.3
	    },
	    {
	      name: "유자",
	      value: 415.4
	    }, 
	    {
	      name: "포도",
	      value: 71.1
	    },
	    {
	      name: "감",
	      value: 69.8
	    },
	    {
	      name: "석류",
	      value: 67.7
	    },
	    {
	      name: "딸기",
	      value: 59.3
	    },
	    {
	      name: "망고",
	      value: 54.8
	    },
	    {
	      name: "레몬",
	      value: 51.2
	    },
	    {
	      name: "복숭아",
	      value: 48.3
	    },
	    {
	      name: "오디",
	      value: 44.4
	    },
	    {
	      name: "청포도",
	      value: 44.3
	    },
	    {
	      name: "샤인머스켓",
	      value: 43.7
	    },
	    {
	      name: "비트",
	      value: 40.2
	    },
	    {
	      name: "청귤",
	      value: 40
	    },
	    {
	      name: "자두",
	      value: 34.7
	    },
	    {
	      name: "자몽",
	      value: 34.6
	    }
	
	    ]
	  }, {
	    name: '채소류',
	    data: [{
	      name: "고추",
	      value: 8.2
	    },
	    {
	      name: "애호박",
	      value: 9.2
	    },
	    {
	      name: "늙은 호박",
	      value: 13.1
	    },
	    {
	      name: "상추",
	      value: 14.1
	    },
	    {
	      name: "당근",
	      value: 14.1
	    },
	    {
	      name: "감자",
	      value: 17.3
	    },
	    {
	      name: "부추",
	      value: 24.3
	    },
	    {
	      name: "양파",
	      value: 25
	    },
	    {
	      name: "콘나물",
	      value: 50.6
	    },
	    {
	      name: "아스파라거스",
	      value: 7.3
	    },
	    {
	      name: "양배추",
	      value: 60.7
	    },
	    {
	      name: "오이",
	      value: 8.9
	    },
	    {
	      name: "순무",
	      value: 9.1
	    },
	    {
	      name: "강낭콩",
	      value: 93.9
	    },
	    {
	      name: "배추",
	      value: 392.7
	    }, {
	      name: "가지",
	      value: 225.1
	    }, {
	      name: "물냉이",
	      value: 141.5
	    }]
	  }, {
	    name: '어류',
	    data: [{
	      name: "굴",
	      value: 409.4
	    },
	    {
	      name: "홍게",
	      value: 34.1
	    },
	    {
	      name: "미역",
	      value: 7.1
	    }]
	  }, {
	    name: '버섯류',
	    data: [{
	      name: "노루궁뎅이 버섯",
	      value: 7.6
	    },
	    {
	      name: "황금팽이 버섯",
	      value: 8.4
	    },
	    {
	      name: "백만송이 버섯",
	      value: 8.3
	    },
	    {
	      name: "만가닥 버섯",
	      value: 10.2
	    },
	    {
	      name: "새송이 버섯",
	      value: 12
	    },
	    {
	      name: "금이 버섯",
	      value: 23.4
	    },
	    {
	      name: "팽이 버섯",
	      value: 30.2
	    },
	    {
	      name: "느타리 버섯",
	      value: 5334.5
	    }, {
	      name: "은이 버섯",
	      value: 566
	    }, {
	      name: "표고 버섯",
	      value: 456.3
	    }]
	  }, {
	    name: '향신 식물',
	    data: [{
	      name: "겨자",
	      value: 7.2
	    },
	    {
	      name: "몰약",
	      value: 52
	    },
	    {
	      name: "사프란",
	      value: 74.1
	    },
	    {
	      name: "정향",
	      value: 501.1
	    }]
	  }, {
	    name: '곡류',
	    data: [{
	      name: "귀리",
	      value: 6.5
	    },
	    {
	      name: "수수",
	      value: 122.6
	    },
	    {
	      name: "메밀",
	      value: 139.9
	    },
	    {
	      name: "보리",
	      value: 158.1
	    },
	    {
	      name: "옥수수",
	      value: 190.2
	    },
	    {
	      name: "율무",
	      value: 201.1
	    },
	    {
	      name: "퀴노아",
	      value: 227.5
	    },
	    {
	      name: "트리티케일",
	      value: 236.2
	    },
	    {
	      name: "호밀",
	      value: 272
	    },
	    {
	      name: "필",
	      value: 276.7
	    },
	    {
	      name: "쌀",
	      value: 10540.8
	    },
	    {
	      name: "밀",
	      value: 8000.9
	    }
	    ]
	  }]
	});



	
	</script>

	
</body>
</html>