<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="main_left_menu">
	<dl>
		<dt id="menu_box_top"><img src="${ctxRoot }images/${menu }/left_title.png" width="157" height="53"></dt>
		<dd style="background:url(${ctxRoot }images/${menu }/left_bg.png) repeat-y">
			<ul id="menu_box_menu">
<c:forEach items="${leftMenu }" var="item">
	<c:choose>
		<c:when test="${item.depth==2 }">
			<c:choose>
				<c:when test="${item.link != null }">
					<c:choose>
						<c:when test="${item.uid==muid }">
						<li class="left_menu_depth2 over"><a href="#" onclick="${item.link }">${item.name }</a></li>
						</c:when>
						<c:otherwise>
						<li class="left_menu_depth2 left_menu_div_hover"><a href="#" onclick="${item.link }">${item.name }</a></li>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${item.cnt_child>0 }">
					<c:choose>
						<c:when test="${item.uid==puid }">
						<li class="left_menu_depth2 bg_menu_minus over" sub="${item.uid }">${item.name }</li>
						</c:when>
						<c:otherwise>
						<li class="left_menu_depth2 bg_menu_plus left_menu_div_hover" sub="${item.uid }">${item.name }</li>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${item.uid==muid }">
						<li class="left_menu_depth2 over" sub="${item.uid }">${item.name }</li>
						</c:when>
						<c:otherwise>
						<li class="left_menu_depth2 left_menu_div_hover" sub="${item.uid }">${item.name }</li>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${item.depth==3 }">
						<li class="left_menu_depth3 parent_${item.parent }<c:if test="${item.parent != puid}"> hide</c:if><c:if test="${item.uid == muid}"> bold</c:if>"><img src="${ctxRoot }images/common/left_menu_bult.gif" width="2" height="6">&nbsp;<a href="${ctxRoot }contents/${menu }.htm?muid=${item.uid }">${item.name }</a></li>
		</c:when>
	</c:choose>
</c:forEach>
			</ul>
		</dd>
		<dd id="menu_box_btm"><img src="${ctxRoot }images/${menu }/left_btm.png" width="157" height="14"></dd>
	</dl>
</div>