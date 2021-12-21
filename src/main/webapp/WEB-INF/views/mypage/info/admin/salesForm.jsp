<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:if test = "${sessionScope.id ne 'admin' }">
	<script>
		alert('잘못된 접근입니다.');
		window.history.back();
	</script>
</c:if>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
    google.charts.load('current', {packages: ['corechart']});
    google.charts.setOnLoadCallback(drawChart1);

    function drawChart1() {
      // Define the chart to be drawn.
      var data1 = new google.visualization.DataTable();
      data1.addColumn('string', 'Element');
      data1.addColumn('number', 'Percentage');
      data1.addRows([
        ['건조기', ${dryer}],
        ['정수기', ${waterpurifier}],
        ['공기청정기',${aircleaner}],
        ['식기세척기', ${washmachine}],
        ['전기레인지', ${microwave}],
        ['냉장고', ${refrigerator}]
      ]);
      var options1 = {
    		'sliceVisibilityThreshold':0  
      };
      // Instantiate and draw the chart.
      var chart1 = new google.visualization.PieChart(document.getElementById('myPieChart'));
      chart1.draw(data1, options1);
    }
    
    
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart2);
    function drawChart2() {
      var data2 = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["1월",${mon1}, "#b87333"],
        ["2월", ${mon2}, "silver"],
        ["3월", ${mon3}, "gold"],
        ["4월", ${mon4}, "green"],
        ["5월", ${mon5}, "red"],
        ["6월", ${mon6}, "blue"],
        ["7월", ${mon7}, "yellow"],
        ["8월", ${mon8}, "pupple"],
        ["9월", ${mon9}, "black"],
        ["10월", ${mon10}, "skyblue"],
        ["11월", ${mon11}, "color: #e5e4e2"],
        ["12월", ${mon12}, "gray"]
      ]);

      var view = new google.visualization.DataView(data2);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
      var options2 = {
        title: "",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart2 = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart2.draw(view, options2);
  }
  </script>
  
  <script>
	function prevYear(year){
		var pYear = year - 1;
		location.replace("${root}index?formpath=sales&year="+pYear);
	}
	function nextYear(year){
		var nYear = year + 1;
		location.replace("${root}index?formpath=sales&year="+nYear);
	}
  </script>
</head>
<body>
<h1>년도별 매출</h1>
	<input type = "button" value ="<" onclick = "prevYear(${year})"> <span>${year }년</span>
	<input type = "button" value =">" onclick = "nextYear(${year})">
  <div id="columnchart_values" style="width: 900px; height: 300px;"></div>
<div>
	<h1>카테고리별 판매량</h1>
</div>
  <div id="myPieChart"></div>
<div>
	<ul>
		<li>건조기 - ${dryPrice }</li>
		<c:forEach var="dp" items="${dryPr }">
			<li>제품명 : ${dp.product_name } - ${dp.price * dp.orderCount } </li>
		</c:forEach>
	</ul>
	<ul>
		<li>공기청정기 - ${airPrice }</li>
		<c:forEach var="ap" items="${airPr }">
			<li>제품명 : ${ap.product_name } - ${ap.price * ap.orderCount}</li>
		</c:forEach>
	</ul>
	<ul>
		<li>전기레인지 - ${microPrice }</li>
		<c:forEach var="mp" items="${microPr }">
			<li>제품명 : ${mp.product_name } - ${mp.price * mp.orderCount }</li>
		</c:forEach>
	</ul>
	<ul>
		<li>냉장고 - ${refriPrice }</li>
		<c:forEach var="rp" items="${refriPr }">
			<li>제품명 : ${rp.product_name } - ${rp.price * rp.orderCount }</li>
		</c:forEach>
	</ul>
	<ul>
		<li>식기세척기 - ${washPrice }</li>
		<c:forEach var="washP" items="${washPr }">
			<li>제품명 : ${washP.product_name } - ${washP.price * washP.orderCount }</li>
		</c:forEach>
	</ul>
	<ul>
		<li>정수기 - ${waterPrice }</li>
		<c:forEach var="waterP" items="${waterPr }">
			<li>제품명 : ${waterP.product_name } - ${waterP.price * waterP.orderCount }</li>
		</c:forEach>
	</ul>
<div>
</div>
	<ul>
	</ul>
</div>
</body>
</html>