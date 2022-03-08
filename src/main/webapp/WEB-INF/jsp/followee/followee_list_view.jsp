<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="followee-box">
<h1 class="text-center mt-3">Followee List</h1>

<table class="table followeeList" >
	<c:forEach items="${followeeView}" var="followee">
		<tr>
			<td>
			<div class="timeline-profile">
				<a href="/user/my_page_view?userId=${followee.user.id}">
					<c:choose>
					<c:when test="${empty followee.user.profileImageUrl}">
						<img src="/images/default_profile_image.gif" alt="profileImage" >
					</c:when>
					<c:otherwise>				
						<img src="${followee.user.profileImageUrl}" alt="profileImage">
					</c:otherwise>
				</c:choose>
				</a>
			</div>
			</td>
		<th class="pt-4"><a href="/user/my_page_view?userId=${followee.user.id}" class="text-decoration-none text-dark">${followee.user.loginId}</a></th>
		<td class="pt-4">${followee.user.name}</td>
	</tr>
	</c:forEach>
</table>
</div>