<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>

<style type="text/css">

/* CSS 초기화 */
* {
	margin: 0;
	padding: 0;
}

ol, ul, li {
	list-style: none;
}

a {
	text-decoration: none;
}

.clearfix::after {
	content: "";
	display: table;
	clear: both;
}

body {
	margin: 50px;
}

table, th, td {
	border: 1px solid #333;
	text-align: center;
}

table {
	border-collapse: collapse;
	float: left;
}

.searchSection {
	width: 500px;
	height: 30px;
}

.searchSection select {
	width: 100%;
	height: 100%;
}

#btnSearch {
	width: 60px;
	height: 30px;
	float: left;
	margin-left: 30px;
}

.serverTime {
	margin-bottom: 50px;
}

h3 {
	margin-bottom: 30px;
}

#top table th {
	width: 80px;
	height: 30px;
}

</style>

</head>
<body>
	<h1>Home Sweet Home</h1>

	<P class="serverTime">The time on the server is ${serverTime}.</P>

	<h3>전체리스트</h3>

	<form action="#" method="GET" id="searchForm" class="clearfix">
		<table class="searchSection">
			<tr>
				<td>카테고리</td>
				<td><select name="category">
						<option value="의류">의류</option>
						<option value="침구">침구</option>
						<option value="가구">가구</option>
				</select></td>
				<td>1차</td>
				<td><select name="firstSelect" onchange="changeSecondSelect()">
						<option value="m">남성</option>
						<option value="f">여성</option>
				</select></td>
				<td>2차</td>
				<td><select name="secondSelect">
				</select></td>
			</tr>
		</table>

		<input type="submit" value="조회" id="btnSearch">
	</form>

	<div id="top">

		<table>

			<thead>
				<tr>
					<th>상품코드</th>
					<th>상품명</th>
					<th>제조사</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>

			<tr>

			</tr>
		</table>

	</div>

	<div id="bottom"></div>


	<script type="text/javascript">
		var maleItems = [ "티셔츠", "바지", "슈트" ];
		var femaleItems = [ "치마", "팬츠", "양말", "티셔츠" ];

		function changeSecondSelect() {
			var firstSelect = document.getElementsByName("firstSelect")[0];
			var secondSelect = document.getElementsByName("secondSelect")[0];
			var selectedValue = firstSelect.options[firstSelect.selectedIndex].value;
			// 변수를 선언하여 첫번째 셀렉트 박스와 두번째 셀렉트 박스를 변수에 넣는다. 
			// 그리고 2차 셀렉트 박스 안에 들어갈 내용을 배열변수를 선언하여 집어넣는다. 
			// getElementsByName은 같은 이름을 가진 복수의 DOM요소들을 선택하는 코드이다.
			// 그러므로 NodeList를 반환한다. 그러므로 list의 첫번째[0]값만 가져온다.

			while (secondSelect.options.length) {
				secondSelect.remove(0);
			} // 2차 카테고리 선택사항이 없어질때까지 선택항목(option)을 없앤다

			var data = selectedValue === "m" ? maleItems : femaleItems;

			for (var i = 0; i < data.length; i++) {
				var option = document.createElement("option");
				option.text = data[i];
				option.value = data[i];
				secondSelect.add(option);
			}
		}

		changeSecondSelect(); // 2차 카테고리 초기내용 설정
	</script>

</body>
</html>
