<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<!--#include file="../Include/md5.asp"-->
<%
response.expires = 0 
response.expiresabsolute = now() - 1 
response.addHeader "pragma","no-cache" 
response.addHeader "cache-control","private" 
Response.cachecontrol = "no-cache"
'========判断是否具有管理权限 
	dim Action,Result,rs,sql,ID

    Result=Trim(request("Result"))
    Action=Trim(request("Action"))
    ID=Cint(request("ID"))

  if Action="SaveEdit" then '保存编辑作品
      if len(trim(request.Form("a003")))<1 then
      response.write ("<script language=javascript> alert('学籍姓名不能为空！');history.back(-1);</script>")
      response.end
      end if
	  
     if Result="Add" then '创建作品
      set rs = server.createobject("adodb.recordset")
	  sql="select * from zhi_rui_s_status"
      rs.open sql,conn,1,3
      rs.addnew
	  
	rs("njname")=Trim(request.form("njname"))
	rs("bjname")=Trim(request.form("bjname"))
	    if len(trim(Request.Form("Password")))<6 or len(trim(Request.Form("Password")))>20  then
          response.write "<script language=javascript> alert('管理员密码必填，且字符数为6-20位！');history.back(-1);</script>"
          response.end
        end if
	rs("Password")=md5(Trim(request.form("Password")))
	
	rs("a001")=	Trim(request.form("a001"))
	rs("a002")=	Trim(request.form("a002"))
	rs("a003")=	Trim(request.form("a003"))
	rs("a004")=	Trim(request.form("a004"))
	rs("a005")=	Trim(request.form("a005"))
	rs("a006")=	Trim(request.form("a006"))
	rs("a007")=	Trim(request.form("a007"))
	rs("a008")=	Trim(request.form("a008"))
	rs("a009")=	Trim(request.form("a009"))
	rs("a010")=	Trim(request.form("a010"))
	rs("a011")=	Trim(request.form("a011"))
	rs("a012")=	Trim(request.form("a012"))
	rs("a013")=	Trim(request.form("a013"))
	rs("a014")=	Trim(request.form("a014"))
	rs("a015")=	Trim(request.form("a015"))
	rs("a016")=	Trim(request.form("a016"))
	rs("a017")=	Trim(request.form("a017"))
	rs("a018")=	Trim(request.form("a018"))
	rs("a019")=	Trim(request.form("a019"))
	rs("a020")=	Trim(request.form("a020"))
	rs("a021")=	Trim(request.form("a021"))
	rs("a022")=	Trim(request.form("a022"))
	rs("a023")=	Trim(request.form("a023"))
	rs("a024")=	Trim(request.form("a024"))
	rs("a025")=	Trim(request.form("a025"))
	rs("a026")=	Trim(request.form("a026"))
	rs("a027")=	Trim(request.form("a027"))
	rs("a028")=	Trim(request.form("a028"))
	rs("a029")=	Trim(request.form("a029"))
	rs("a030")=	Trim(request.form("a030"))
	rs("a031")=	Trim(request.form("a031"))
	rs("a032")=	Trim(request.form("a032"))
	rs("a033")=	Trim(request.form("a033"))
	rs("a034")=	Trim(request.form("a034"))
	rs("a035")=	Trim(request.form("a035"))
	rs("a036")=	Trim(request.form("a036"))
	rs("a037")=	Trim(request.form("a037"))
	rs("a038")=	Trim(request.form("a038"))
	rs("a039")=	Trim(request.form("a039"))
	rs("a040")=	Trim(request.form("a040"))
	rs("a041")=	Trim(request.form("a041"))
	rs("a042")=	Trim(request.form("a042"))
	rs("a043")=	Trim(request.form("a043"))
	rs("a044")=	Trim(request.form("a044"))
	rs("a045")=	Trim(request.form("a045"))
	rs("a046")=	Trim(request.form("a046"))
	rs("a047")=	Trim(request.form("a047"))
	rs("a048")=	Trim(request.form("a048"))
	rs("a049")=	Trim(request.form("a049"))
	rs("a050")=	Trim(request.form("a050"))
	rs("a051")=	Trim(request.form("a051"))
	rs("a052")=	Trim(request.form("a052"))
	rs("a053")=	Trim(request.form("a053"))
	rs("a054")=	Trim(request.form("a054"))
	rs("a055")=	Trim(request.form("a055"))
	rs("a056")=	Trim(request.form("a056"))
	rs("a057")=	Trim(request.form("a057"))
	rs("a058")=	Trim(request.form("a058"))
	rs("a059")=	Trim(request.form("a059"))
	rs("a060")=	Trim(request.form("a060"))
	rs("a061")=	Trim(request.form("a061"))
	rs("a062")=	Trim(request.form("a062"))
	rs("a063")=	Trim(request.form("a063"))
	rs("a064")=	Trim(request.form("a064"))
	rs("a065")=	Trim(request.form("a065"))
	rs("a066")=	Trim(request.form("a066"))
	rs("a067")=	Trim(request.form("a067"))
	rs("a068")=	Trim(request.form("a068"))
	rs("a069")=	Trim(request.form("a069"))
	rs("a070")=	Trim(request.form("a070"))
	rs("a071")=	Trim(request.form("a071"))
	rs("a072")=	Trim(request.form("a072"))
	rs("a073")=	Trim(request.form("a073"))
	
	rs("AddTime")=now()
	end if  
	if Result="Modify" then '修改作品
      set rs = server.createobject("adodb.recordset")
      sql="select * from zhi_rui_s_status where ID="&ID
      rs.open sql,conn,1,3
	  
	rs("njname")=Trim(request.form("njname"))
	rs("bjname")=Trim(request.form("bjname"))
	
    if trim(Request.Form("Password"))<>"" then
	    if len(trim(Request.Form("Password")))<6 or len(trim(Request.Form("Password")))>20  then
          response.write "<script language=javascript> alert('管理员密码必填，且字符数为6-20位！');history.back(-1);</script>"
          response.end
        end if
	    rs("Password")=md5(Trim(request.form("Password")))
	end if
	
	rs("a001")=	Trim(request.form("a001"))
	rs("a002")=	Trim(request.form("a002"))
	rs("a003")=	Trim(request.form("a003"))
	rs("a004")=	Trim(request.form("a004"))
	rs("a005")=	Trim(request.form("a005"))
	rs("a006")=	Trim(request.form("a006"))
	rs("a007")=	Trim(request.form("a007"))
	rs("a008")=	Trim(request.form("a008"))
	rs("a009")=	Trim(request.form("a009"))
	rs("a010")=	Trim(request.form("a010"))
	rs("a011")=	Trim(request.form("a011"))
	rs("a012")=	Trim(request.form("a012"))
	rs("a013")=	Trim(request.form("a013"))
	rs("a014")=	Trim(request.form("a014"))
	rs("a015")=	Trim(request.form("a015"))
	rs("a016")=	Trim(request.form("a016"))
	rs("a017")=	Trim(request.form("a017"))
	rs("a018")=	Trim(request.form("a018"))
	rs("a019")=	Trim(request.form("a019"))
	rs("a020")=	Trim(request.form("a020"))
	rs("a021")=	Trim(request.form("a021"))
	rs("a022")=	Trim(request.form("a022"))
	rs("a023")=	Trim(request.form("a023"))
	rs("a024")=	Trim(request.form("a024"))
	rs("a025")=	Trim(request.form("a025"))
	rs("a026")=	Trim(request.form("a026"))
	rs("a027")=	Trim(request.form("a027"))
	rs("a028")=	Trim(request.form("a028"))
	rs("a029")=	Trim(request.form("a029"))
	rs("a030")=	Trim(request.form("a030"))
	rs("a031")=	Trim(request.form("a031"))
	rs("a032")=	Trim(request.form("a032"))
	rs("a033")=	Trim(request.form("a033"))
	rs("a034")=	Trim(request.form("a034"))
	rs("a035")=	Trim(request.form("a035"))
	rs("a036")=	Trim(request.form("a036"))
	rs("a037")=	Trim(request.form("a037"))
	rs("a038")=	Trim(request.form("a038"))
	rs("a039")=	Trim(request.form("a039"))
	rs("a040")=	Trim(request.form("a040"))
	rs("a041")=	Trim(request.form("a041"))
	rs("a042")=	Trim(request.form("a042"))
	rs("a043")=	Trim(request.form("a043"))
	rs("a044")=	Trim(request.form("a044"))
	rs("a045")=	Trim(request.form("a045"))
	rs("a046")=	Trim(request.form("a046"))
	rs("a047")=	Trim(request.form("a047"))
	rs("a048")=	Trim(request.form("a048"))
	rs("a049")=	Trim(request.form("a049"))
	rs("a050")=	Trim(request.form("a050"))
	rs("a051")=	Trim(request.form("a051"))
	rs("a052")=	Trim(request.form("a052"))
	rs("a053")=	Trim(request.form("a053"))
	rs("a054")=	Trim(request.form("a054"))
	rs("a055")=	Trim(request.form("a055"))
	rs("a056")=	Trim(request.form("a056"))
	rs("a057")=	Trim(request.form("a057"))
	rs("a058")=	Trim(request.form("a058"))
	rs("a059")=	Trim(request.form("a059"))
	rs("a060")=	Trim(request.form("a060"))
	rs("a061")=	Trim(request.form("a061"))
	rs("a062")=	Trim(request.form("a062"))
	rs("a063")=	Trim(request.form("a063"))
	rs("a064")=	Trim(request.form("a064"))
	rs("a065")=	Trim(request.form("a065"))
	rs("a066")=	Trim(request.form("a066"))
	rs("a067")=	Trim(request.form("a067"))
	rs("a068")=	Trim(request.form("a068"))
	rs("a069")=	Trim(request.form("a069"))
	rs("a070")=	Trim(request.form("a070"))
	rs("a071")=	Trim(request.form("a071"))
	rs("a072")=	Trim(request.form("a072"))
	rs("a073")=	Trim(request.form("a073"))
	
	rs("AddTime")=now()
	end if
	rs.update
	rs.close
    set rs=nothing 
    response.write "<script language=javascript> alert('成功编辑档案！');location.replace('Admin_Order.asp');</script>"
  end if
%>