<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        ["1월", 1896600000, "#b87333"],
        ["2월", 10.49, "silver"],
        ["3월", 19.30, "gold"],
        ["4월", 21.45, "green"],
        ["5월", 21.45, "red"],
        ["6월", 21.45, "blue"],
        ["7월", 21.45, "yellow"],
        ["8월", 21.45, "pupple"],
        ["9월", 21.45, "black"],
        ["10월", 21.45, "skyblue"],
        ["11월", 21.45, "color: #e5e4e2"],
        ["12월", 21.45, "gray"]
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
</head>
<body>
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

	<ul>
	</ul>
</div>
	<h1>년도별 매출</h1>
	<input type = "button" value ="<"><span>2021년</span><input type = "button" value =">" onclick = "nexeYear()">
</div>
  <div id="columnchart_values" style="width: 900px; height: 300px;"></div>
</body>
</html>