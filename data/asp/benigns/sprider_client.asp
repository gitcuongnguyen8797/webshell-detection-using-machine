<!--
autor:索索软件工作室
date:2017-01-18
QQ:859867801
-->
<%@language=vbscript codepage=65001 %>
<% Response.Charset = "utf-8" %>
<%
Server.ScriptTimeOut = 500

postUrl = "http://localhost:81/sprider_post.asp"

'获取列表
msg = getHTTPPage("http://app.taxwen.com/taxcloud/read/find/getAllClassify")
'Response.write(msg)

'解析列表
arru = RegExpTest("ncid"":""(.*?)""", msg)
arruText = RegExpTest("name"":""(.*?)""", msg)
for i=0 to ubound(arru)-1

	itemUrl = "http://app.taxwen.com/taxcloud/read/find/getSubClassById?ncid="+ arru(i)
	'response.write(itemUrl&"<br>")
	msgItem = getHTTPPage(itemUrl)
	'response.write(msgItem&"<br>")
	
	arruItem = RegExpTest("cid"":""(.*?)""", msgItem)
	arruItemText = RegExpTest("name"":""(.*?)""", msgItem)

	for j=0 to ubound(arruItem)-1
		
		itemUrlList = "http://app.taxwen.com/taxcloud/read/findlist/newslist?cid="+arruItem(j)+"&pageNo=1"
		'response.write(itemUrlList&"<br>")

		msgItemList = getHTTPPage(itemUrlList)

		'response.write(msgItemList&"<br>")

		arruItemDet = RegExpTest("docid"":""(.*?)""", msgItemList)
		arruItemDetTime = RegExpTest("indate"":(.*?),", msgItemList)
		arruItemDetText = RegExpTest("title"":""(.*?)""", msgItemList)

		for k=0 to ubound(arruItemDet)-1
			ctime = CDbl(arruItemDetTime(k))
			nTime = CDbl(getTime())
			If ctime > nTime Then
				itemUrlListDet = "http://app.taxwen.com/taxcloud/read/findlist/getnewscontent?docid="+arruItemDet(k)+"&userid= "
				
				'response.write("ctime:"&ctime&"-getTime:"&getTime()&"-"&FromUnixTime(ctime, +8)&"大余"&FromUnixTime(getTime(), +8)&"<br>")

				msgItemListDet = getHTTPPage(itemUrlListDet)

				title = RegExpTest("<title>(.*?)</title>", msgItemListDet)
				txt = RegExpTest("<div style=""border-top: solid 1px #eee;""></div>([\s\S]*?)</div>", msgItemListDet)
				
				
				If IsEmpty(title)=False And IsEmpty(txt)=False And ubound(txt)>=1 And ubound(title)>=1 Then
					txtsrc = txt(0)
				
					arruItemDetImg = RegExpTest("img data-original=""(.*?)""", txtsrc)
					for n=0 to ubound(arruItemDetImg)-1
						patrn = "<img data-original="""+arruItemDetImg(n)+""" src=""./media/jquery/loading.gif"" style=""max-width:100%"">"
						replStr = "[img]"&arruItemDetImg(n)&"[/img]"
						txtsrc = ReplaceHTML(txtsrc, patrn, replStr)
					Next
					
					response.write arruText(i)&"-"&arruItemText(j)&"-"&arruItemDetText(k)&"-"&FromUnixTime(ctime, +8)
					param = "title="&title(0)&"&txt="+txtsrc&"&homepage="+itemUrlListDet
					srst = PostHTTPPage(postUrl, param)
					rst = CDbl(srst)

					If rst > 0 Then
						response.write "：上传成功"&"<br>"
					ElseIf rst < 0 Then
						response.write "：已存在"&"<br>"
					Else
						response.write "：上传失败"&"<br>"
					End If

				End If
			End If
		Next
	Next
Next


Function FromUnixTime(intTime, intTimeZone)
	If Len(intTime) =13 Then
		intTime = left(intTime, 10)
	End if


    If IsEmpty(intTime) or Not IsNumeric(intTime) Then
        FromUnixTime = Now()
        Exit Function
    End If         
    If IsEmpty(intTime) or Not IsNumeric(intTimeZone) Then intTimeZone = 0
    FromUnixTime = DateAdd("s", intTime, "1970-01-01 00:00:00")
    FromUnixTime = DateAdd("h", intTimeZone, FromUnixTime)
End Function


Public Function getTime()
	getTime = DateDiff("s", "1970-01-01 08:00:00", Date()) * 1000 + Int(CDbl(Timer()) * 1000)-60*60*24*3*1000
End Function


function PostHTTPPage(url,data)
	dim Http
	set Http=server.createobject("MSXML2.SERVERXMLHTTP.3.0")
	Http.open "POST",url,false
	Http.setRequestHeader "CONTENT-TYPE", "application/x-www-form-urlencoded"
	Http.send(data)
	if Http.readystate<>4 then
	exit function
	End if
	PostHTTPPage=bytesToBSTR1(Http.responseBody,"utf-8")
	set http=nothing

End Function


Function  bytesToBSTR1(body,Cset)
	if lenb(body)=0  then
	   bytesToBSTR1=""
	   exit  function
	end if
	dim mystream
	set mystream=server.createobject("adodb.stream")
	mystream.type=2
	mystream.mode=3
	mystream.open
	mystream.writetext body
	mystream.position=0
	mystream.charset=Cset
	mystream.position=2
	bstr=mystream.readtext()
	mystream.close
	set mystream=nothing
	bytesToBSTR1=bstr
End Function

 Function getHTTPPage(url)
    dim objXML
    set objXML=createobject("MSXML2.XMLHTTP")
    objXML.open "get",url,false
    objXML.send()
    If objXML.readystate<>4 then
        exit function
    End If
    getHTTPPage=bytesToBSTR1(objXML.responseBody,"utf-8")
    set objXML=nothing
    if err.number<>0 then err.Clear
End Function

Function RegExpTest(patrn, strng)
	Dim regEx, Match, Matches ' 建立变量。
	Set regEx = New RegExp ' 建立正则表达式。
	regEx.Pattern = patrn ' 设置模式。
	regEx.IgnoreCase = True ' 设置是否区分大小写。
	regEx.Global = True ' 设置全程可用性。

	Set Matches = regEx.Execute(strng) ' 执行搜索。
	For Each Match in Matches ' 遍历 Matches 集合。

	RetStr = RetStr & Match.SubMatches(0) & "," '值为123和44的数组

	Next
	RegExpTest = Split(RetStr, ",")
End Function 


'正则替换函数
Function ReplaceHTML(srcstr, patrn, replStr)
	Set regEx = New RegExp
	regEx.Pattern = patrn
	regEx.IgnoreCase = True
	regEx.Global = True
	regEx.Execute(srcstr)
	ReplaceHTML = regEx.Replace(srcstr, replStr)
	Set regEx = Nothing
End Function

%>