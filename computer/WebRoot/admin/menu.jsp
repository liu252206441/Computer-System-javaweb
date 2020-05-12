<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.daowen.bll.*"%>

<script type="text/javascript">

    $(function () {

        $("#divAccordion dl dt").click(function () {



            $("#divAccordion dl").removeClass("current").addClass("bitem2");
            $("#divAccordion dl dd").hide();

            $(this).siblings("dd").show();
            $(this).parent().addClass("current");


        });

        $(".sitemu li").click(function () {

            $(".sitemu li").removeClass("selected");
            $(this).addClass("selected");

        });

        var menuid = '<%=request.getParameter("menuid")%>';

		if (menuid != "") {
			$("#" + menuid).addClass("selected");
			$("#divAccordion dl dd").hide();
			$("#" + menuid).closest("dd").show().parent().addClass("current");
		}

	})
</script>
<div class="left">
	<div style="width: 145px; height: 480px; padding: 0; margin: 0"
		id="divAccordion">
		<div class="bgtop">
			<b>系统菜单</b>
		</div>

		
		
		<dl class="bitem2">
			<dt>
				<i class="fa fa-user"></i> <b>商品管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">

					
					<li>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/shangpinmanager.do?actiontype=get">商品管理</a>
			</li>
			<li>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/shangpinmanager.do?actiontype=load">发布商品</a>
			</li>
				
			<li>
				<a   target="main"  target="main" href="<%=SystemParam.getSiteRoot() %>/admin/spcategorymanager.do?actiontype=get&forwardurl=/admin/spcategorytreemanager.jsp">商品类别管理</a>
			</li>
			
		    <li>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/dingdanmanager.do?actiontype=get&seedid=204">订单管理</a>
			</li>
			
			
			

				</ul>
			</dd>
		</dl>
		
		<dl class="bitem2">
			<dt>
				<i class="fa fa-cog"></i> <b>网站设置 </b>
			</dt>
			<dd class="current">
				<ul class="sitemu">

			
					<li >
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/sitenavmanager.do?actiontype=get&seedid=303">首页导航管理</a>
			</li>
			<li>
				<a   target="main" href="<%=SystemParam.getSiteRoot() %>/admin/indexcolumnsmanager.do?actiontype=get">首页栏目管理</a>
			</li>
			 <li>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/noticemanager.do?actiontype=get&seedid=304">系统公告管理</a>
			</li>
			
			 <li>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/jiaodiantumanager.do?actiontype=get&seedid=305">焦点图管理</a>
			</li>
			
			<li>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/friendlinkmanager.do?actiontype=get&seedid=306">友情链接管理</a>
			</li>
			
		    <li>
				<a target="main" href="<%=SystemParam.getSiteRoot() %>/admin/commentmanager.do?actiontype=get">会员评论管理</a>
			</li>
			
			

			  </ul>
				
			</dd>
		</dl>
		<dl class="bitem2">
			<dt>
				<i class="fa fa-info"></i>  <b>系统用户</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">

					<li><a target="main"
						href="<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do?actiontype=get">
							会员管理 </a>
					</li>

						<li><a target="main"
						href="<%=SystemParam.getSiteRoot()%>/admin/usersmanager.do?actiontype=get&forwardurl=/admin/usersmanager.jsp">
							后台用户管理 </a>
					</li>


				</ul>
			</dd>
		</dl>
		
		
		<dl class="bitem2">
			<dt>
				<i class="fa fa-user"></i>  <b>账户管理</b>
			</dt>
			<dd class="current">
				<ul class="sitemu">
					
					<li><a target="main"
						href="<%=SystemParam.getSiteRoot()%>/admin/modifypw.jsp">修改密码</a>
					</li>
					<li><a target="main"
						href="<%=SystemParam.getSiteRoot()%>/admin/accountinfo.jsp">账户信息</a>
					</li>
					<li><a target="main"
						href="<%=SystemParam.getSiteRoot()%>/admin/modifyinfo.jsp">编辑信息</a>
					</li>
				</ul>
			</dd>
		</dl>

		<div class="clear"></div>
	</div>
</div>

