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
	    text: '���� ���� �α��ִ� ��깰 (2020)'
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
	    name: '���Ϸ�',
	    data: [{
	      name: '��',
	      value: 767.1
	    }, {
	      name: 'ü��',
	      value: 20.7
	    },
	    {
	      name: "�޷�",
	      value: 97.2
	    },
	    {
	      name: "���",
	      value: 111.7
	    },
	    {
	      name: "�ٳ���",
	      value: 158.1
	    },
	    {
	      name: "����丶��",
	      value: 241.6
	    },
	    {
	      name: "�ź�",
	      value: 249.1
	    },
	    {
	      name: "ȫ��",
	      value: 298.1
	    },
	    {
	      name: "����",
	      value: 323.7
	    },
	    {
	      name: "����",
	      value: 78.3
	    },
	    {
	      name: "����",
	      value: 415.4
	    }, 
	    {
	      name: "����",
	      value: 71.1
	    },
	    {
	      name: "��",
	      value: 69.8
	    },
	    {
	      name: "����",
	      value: 67.7
	    },
	    {
	      name: "����",
	      value: 59.3
	    },
	    {
	      name: "����",
	      value: 54.8
	    },
	    {
	      name: "����",
	      value: 51.2
	    },
	    {
	      name: "������",
	      value: 48.3
	    },
	    {
	      name: "����",
	      value: 44.4
	    },
	    {
	      name: "û����",
	      value: 44.3
	    },
	    {
	      name: "���θӽ���",
	      value: 43.7
	    },
	    {
	      name: "��Ʈ",
	      value: 40.2
	    },
	    {
	      name: "û��",
	      value: 40
	    },
	    {
	      name: "�ڵ�",
	      value: 34.7
	    },
	    {
	      name: "�ڸ�",
	      value: 34.6
	    }
	
	    ]
	  }, {
	    name: 'ä�ҷ�',
	    data: [{
	      name: "����",
	      value: 8.2
	    },
	    {
	      name: "��ȣ��",
	      value: 9.2
	    },
	    {
	      name: "���� ȣ��",
	      value: 13.1
	    },
	    {
	      name: "����",
	      value: 14.1
	    },
	    {
	      name: "���",
	      value: 14.1
	    },
	    {
	      name: "����",
	      value: 17.3
	    },
	    {
	      name: "����",
	      value: 24.3
	    },
	    {
	      name: "����",
	      value: 25
	    },
	    {
	      name: "�ܳ���",
	      value: 50.6
	    },
	    {
	      name: "�ƽ��Ķ�Ž�",
	      value: 7.3
	    },
	    {
	      name: "�����",
	      value: 60.7
	    },
	    {
	      name: "����",
	      value: 8.9
	    },
	    {
	      name: "����",
	      value: 9.1
	    },
	    {
	      name: "������",
	      value: 93.9
	    },
	    {
	      name: "����",
	      value: 392.7
	    }, {
	      name: "����",
	      value: 225.1
	    }, {
	      name: "������",
	      value: 141.5
	    }]
	  }, {
	    name: '���',
	    data: [{
	      name: "��",
	      value: 409.4
	    },
	    {
	      name: "ȫ��",
	      value: 34.1
	    },
	    {
	      name: "�̿�",
	      value: 7.1
	    }]
	  }, {
	    name: '������',
	    data: [{
	      name: "���õ��� ����",
	      value: 7.6
	    },
	    {
	      name: "Ȳ������ ����",
	      value: 8.4
	    },
	    {
	      name: "�鸸���� ����",
	      value: 8.3
	    },
	    {
	      name: "������ ����",
	      value: 10.2
	    },
	    {
	      name: "������ ����",
	      value: 12
	    },
	    {
	      name: "���� ����",
	      value: 23.4
	    },
	    {
	      name: "���� ����",
	      value: 30.2
	    },
	    {
	      name: "��Ÿ�� ����",
	      value: 5334.5
	    }, {
	      name: "���� ����",
	      value: 566
	    }, {
	      name: "ǥ�� ����",
	      value: 456.3
	    }]
	  }, {
	    name: '��� �Ĺ�',
	    data: [{
	      name: "����",
	      value: 7.2
	    },
	    {
	      name: "����",
	      value: 52
	    },
	    {
	      name: "������",
	      value: 74.1
	    },
	    {
	      name: "����",
	      value: 501.1
	    }]
	  }, {
	    name: '���',
	    data: [{
	      name: "�͸�",
	      value: 6.5
	    },
	    {
	      name: "����",
	      value: 122.6
	    },
	    {
	      name: "�޹�",
	      value: 139.9
	    },
	    {
	      name: "����",
	      value: 158.1
	    },
	    {
	      name: "������",
	      value: 190.2
	    },
	    {
	      name: "����",
	      value: 201.1
	    },
	    {
	      name: "�����",
	      value: 227.5
	    },
	    {
	      name: "Ʈ��Ƽ����",
	      value: 236.2
	    },
	    {
	      name: "ȣ��",
	      value: 272
	    },
	    {
	      name: "��",
	      value: 276.7
	    },
	    {
	      name: "��",
	      value: 10540.8
	    },
	    {
	      name: "��",
	      value: 8000.9
	    }
	    ]
	  }]
	});



	
	</script>

	
</body>
</html>