<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<hr />
<!-- /END THE FEATURETTES -->
<!-- FOOTER -->
<footer>
	<HR><a href="<%=path%>/admin/login.jsp">吃了么后台</a>
</footer>
