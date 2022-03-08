<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="followee-box">
<h1 class="text-center mt-3">Follower List</h1>

<table class="table followeeList" >
	<c:forEach items="${followerView}" var="follower">
		<tr>
			<td>
			<div class="timeline-profile">
				<a href="/user/my_page_view?userId=${follower.user.id}">
					<c:choose>
					<c:when test="${empty follower.user.profileImageUrl}">
						<img src="/images/default_profile_image.gif" alt="profileImage" >
					</c:when>
					<c:otherwise>				
						<img src="${follower.user.profileImageUrl}" alt="profileImage">
					</c:otherwise>
				</c:choose>
				</a>
			</div>
			</td>
		<th class="pt-4"><a href="/user/my_page_view?userId=${follower.user.id}" class="text-decoration-none text-dark">${follower.user.loginId}</a></th>
		<td class="pt-4">${follower.user.name}</td>
	</tr>
	</c:forEach>
</table>
</div>