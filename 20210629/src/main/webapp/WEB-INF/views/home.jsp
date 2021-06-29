<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<title>Home</title>

</head>
<body>
	<h1>
		TOAST UI GRID 테스트  
	</h1>
	
	<div id="grid">
	
	</div>
	
	<div>
		<h1><a href="chartTest.do">chartTest</a></h1>
	</div>
</body>

<script>

	//var list = '<c:out value="${list}"/>';
	//console.log(list);
	
	// 나는 "" + "" + ... 이런 식으로 해야할 줄 알았는데 아니었음. 이렇게하면 JSON 형식으로 나오는게 아니라 한 문장으로 나오는 것이라 틀린 것이었다.
	var alist = [
		<c:forEach items='${list}' var='list' varStatus='status'>
			{ field:'${list.fileId}', 
				career:'${list.career}', 
				age:'${list.age}', 
				salary_desired:'${list.salary_desired}' 
			}
			<c:if test='${not status.last}'>,</c:if>
		</c:forEach>
		]
	//console.log(alist);
		
	const recruitData =
 		[ 
			{ field:'자바스크립트', career:'7년', age:'12세', salary_desired:'1억' }, 
			{ field:'파이썬', career:'3년', age:'9세', salary_desired:'2억' }, 
			{ field:'자바', career:'9년', age:'15세', salary_desired:'3억' }, 
			{ field:'A.I', career:'10년', age:'17세', salary_desired:'4억' } 
		] 
	
	const recruitGrid = new tui.Grid({
		el: document.getElementById('grid'), 
		data: alist,
		columns: [ 
			{ header: '분야', name: 'field', align: 'center' }, 
			{ header: '경력', name: 'career', editor: 'text' }, 
			{ header: '나이', name: 'age' }, 
			{ header: '희망연봉', name: 'salary_desired' } 
		],
		pagination: true,
		pageOptions: {
			useClient: true,
		    perPage: 10
		  }
		});

</script>

</html>
