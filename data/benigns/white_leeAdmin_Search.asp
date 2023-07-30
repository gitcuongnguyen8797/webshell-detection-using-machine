<!--#include file="../Include/conig.asp"-->
<!--#include file="Admin_check.asp"-->
<%
dim Result
dim StartDate,EndDate,Keyword,mtype,ccid,bcid

  Result=request.QueryString("Result")
  StartDate=request.form("Start_Date")
  EndDate=request.form("End_Date")
  Keyword=request.form("Keyword")
  mtype=request.form("mtype")
  ccid=Trim(request.form("ccid"))
  bcid=Trim(request.form("bcid"))
  
select case Result
  case "News"
    response.redirect ("Admin_infoli.asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "shool"
    response.redirect ("Admin_sofoli.asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "down"
    response.redirect ("Admin_nofoli.asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "mark"
    response.redirect ("Admin_markli.asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "Dews"
    response.redirect ("Admin_Defoli.asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "Message"
    response.redirect ("Admin_MesList.asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "ADLO"
    response.redirect ("Admin_AdList.asp?Result=Search&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "Teache"
    response.redirect ("Admin_order.asp?Result=Search&ccid="&ccid&"&bcid="&bcid&"&Xuank="&Xuank&"&StartDate="&StartDate&"&EndDate="&EndDate&"&Keyword="&server.urlencode(Keyword)&"&Page=1")
  case "Baoxls"
    response.redirect ("Admin_Baoming.asp?Result=Search&mtype="&mtype&"&StartDate="&StartDate&"&EndDate="&EndDate&"&Page=1")
  case else
end select
%>