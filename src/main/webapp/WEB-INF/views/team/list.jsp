<%@page import="site.metacoding.red.domain.stadium.Stadium"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<br />

	<table class="table table-striped">
		<thead>
			<tr>
				<th>번호</th>
				<th>경기장이름</th>
				<th>팀이름</th>
				<th>팀창단일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="team" items="${teamList}">
				<tr>
					<td>${team.no}</td>
					<td>${team.stadiumName}</td>
					<td>${team.name}</td>
					<td>${team.createdAt}</td>
					<td><button onclick="btndelete(${team.id});" class="btn btn-danger">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<<script>
function btndelete(id){
	$.ajax("/team/"+id,{
		type: "DELETE",
		dataType: "json",
	}).done((res)=>{
		if(res.code == 1){ // 성공
			alert("팀 삭제 성공");
			location.reload();
		}else{ // 실패
			alert("팀 삭제 실패하였습니다.");
		}
	});
}
</script>

<%@ include file="../layout/footer.jsp"%>

