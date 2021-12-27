<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css" /> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage_admin.css"/>

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
<style>
.inin{
	margin: 0 20px;
    border: none;
    background: none;
    font-size: 20px;
    }</style>
</head>
<body>
	<div class="mypage_wrap">
	<div>
		<h3 style="font-size: 24; margin: 0 0 20 0px;">년도별 매출</h3>
		<hr>
	</div>
	<div style="    
	text-align: center;
    font-size: 20px;
    margin: 20px;
    justify-content: center;
    display: flex;
    align-items: center;
    padding: 10px;">
		<input class="inin" type = "button" value ="<" onclick = "prevYear(${year})"> <span>${year }년</span>
		<input class="inin" type = "button" value =">" onclick = "nextYear(${year})">
	</div>
	<div id="columnchart_values" style="width: 900px; height: 300px;"></div>
	<div>
		<h1>카테고리별 판매량</h1>
	</div>
	  <div id="myPieChart"></div>
	  <div>
		<h1>카테고리별 판매량</h1>
	</div>
	<div>
		<div class="sale_search_form">
		<!-- 	<div>
			
					<span class="modify_form_text">카테고리 : 
						<select class="classification" name = "classification">
							<option value = "dryer">건조기</option>
							<option value = "aircleaner">공기청정기</option>
							<option value = "microwave">전기레인지</option>
							<option value = "refrigerator">냉장고</option>
							<option value = "washmachine">식기세척기</option>
							<option value = "waterpurifier">정수기</option>
						</select>
					</span>
			</div> -->
			<!-- <div style="    display: flex; align-items: center;">
				 <input class="review_underbar_2" type=text name='search'/>
				 <input class="submit_modify_btn" style=" display: block;width: 80px;"type = "submit"  name='searchBtn' value = "검색">
			</div> -->
		</div>
		<div>
<!-- 		<ul> -->
<%-- 			<li>건조기 - ${dryPrice }</li> --%>
<%-- 			<li>공기청정기 - ${airPrice }</li> --%>
<%-- 			<li>전기레인지 - ${microPrice }</li> --%>
<%-- 			<li>냉장고 - ${refriPrice }</li> --%>
<%-- 			<li>식기세척기 - ${washPrice }</li> --%>
<%-- 			<li>정수기 - ${waterPrice }</li> --%>
<!-- 		</ul> -->
		<div class="membermanage_navbar">
					<div style=" width: 310px; text-align: center;">카테고리</div>
					<div style=" width: 410px; text-align: center;">상품명</div>
					<div style=" width: 310px; text-align: center;">주문수</div>
					
					
		</div>
			<ul class="membermanage_component-main">
				<li>건조기 총 주문 수 : ${dryer }</li>

			</ul>
			<ul>
				<c:forEach var="dp" items="${dryPr }">
				<div class="membermanage_component">
					<li class="membermanage_component_category">건조기</li>
					<li class="membermanage_component_product">${dp.product_name }</li>
					<li class="membermanage_component_price">${dp.price * dp.orderCount } </li>
				</div>	
				</c:forEach>
			</ul>
		
			<ul class="membermanage_component-main">
				<li>공기청정기 총 주문 수 : ${aircleaner }</li>
				
			</ul>
			<ul>
				<c:forEach var="ap" items="${airPr }">
				<div class="membermanage_component">
					<li class="membermanage_component_category">공기청정기</li>
					<li class="membermanage_component_product">${ap.product_name }</li>
					<li class="membermanage_component_price">${ap.price * ap.orderCount} </li>
				</div>	
				</c:forEach>
			</ul>
		
		
			<ul class="membermanage_component-main">
				<li>전기레인지 총 주문 수 : ${microwave }</li>
			
			</ul>
			<ul>
				<c:forEach var="mp" items="${microPr }">
				<div class="membermanage_component">
					<li class="membermanage_component_category">전기레인지</li>
					<li class="membermanage_component_product">${mp.product_name }</li>
					<li class="membermanage_component_price">${mp.price * mp.orderCount }</li>
				</div>	
				</c:forEach>
			</ul>
			
			<ul class="membermanage_component-main">
				<li>냉장고 총 주문 수 : ${refrigerator }</li>
				
			</ul>
			<ul>
				<c:forEach var="rp" items="${refriPr }">
				<div class="membermanage_component">
					<li class="membermanage_component_category">냉장고</li>
					<li class="membermanage_component_product">${rp.product_name }</li>
					<li class="membermanage_component_price">${rp.price * rp.orderCount }</li>
				</div>	
				</c:forEach>
			</ul>
			
			<ul class="membermanage_component-main">
				<li>식기세척기 총 주문 수 : ${washmachine }</li>
				
			</ul>
			<ul>
				<c:forEach var="washP" items="${washPr }">
				<div class="membermanage_component">
					<li class="membermanage_component_category">식기세척기</li>
					<li class="membermanage_component_product">${washP.product_name }</li>
					<li class="membermanage_component_price">${washP.price * washP.orderCount }</li>
				</div>	
				</c:forEach>
			</ul>

			<ul class="membermanage_component-main">
				<li>정수기 총 주문 수 : ${waterpurifier }</li>
				
			</ul>
			<ul>
				<c:forEach var="waterP" items="${waterPr }">
				<div class="membermanage_component">
					<li class="membermanage_component_category">정수기</li>
					<li class="membermanage_component_product">${waterP.product_name }</li>
					<li class="membermanage_component_price">${waterP.price * waterP.orderCount }</li>
				</div>	
				</c:forEach>
			</ul>

		
	</div>
	
	</div>
	</div>
</body>
</html>