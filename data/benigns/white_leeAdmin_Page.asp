<%
Const Btn_First="�ס�ҳ"  '�����һҳ��ť��ʾ��ʽ
Const Btn_Prev="��һҳ"  '����ǰһҳ��ť��ʾ��ʽ
Const Btn_Next="��һҳ"  '������һҳ��ť��ʾ��ʽ
Const Btn_Last="ĩ��ҳ"  '�������һҳ��ť��ʾ��ʽ
Const XD_Align="Center"     '�����ҳ��Ϣ���뷽ʽ
Const XD_Width="100%"     '�����ҳ��Ϣ���С

Class Xdownpage
Private XD_PageCount,XD_Conn,XD_Rs,XD_SQL,XD_PageSize,Str_errors,int_curpage,str_URL,int_totalPage,int_totalRecord,XD_sURL


'=================================================================
'PageSize ����
'����ÿһҳ�ķ�ҳ��С
'=================================================================
Public Property Let PageSize(int_PageSize)
 If IsNumeric(Int_Pagesize) Then
  XD_PageSize=CLng(int_PageSize)
 Else
  str_error=str_error & "PageSize�Ĳ�������ȷ"
  ShowError()
 End If
End Property
Public Property Get PageSize
 If XD_PageSize="" or (not(IsNumeric(XD_PageSize))) Then
  PageSize=10     
 Else
  PageSize=XD_PageSize
 End If
End Property

'=================================================================
'GetRS ����
'���ط�ҳ��ļ�¼��
'=================================================================
Public Property Get GetRs()
 Set XD_Rs=Server.createobject("adodb.recordset")
 XD_Rs.PageSize=PageSize
 XD_Rs.Open XD_SQL,XD_Conn,1,1
 If not(XD_Rs.eof and XD_RS.BOF) Then
  If int_curpage>XD_RS.PageCount Then
   int_curpage=XD_RS.PageCount
  End If
  XD_Rs.AbsolutePage=int_curpage
 End If
 Set GetRs=XD_RS
End Property

'================================================================
'GetConn  �õ����ݿ�����
'
'================================================================ 
Public Property Let GetConn(obj_Conn)
 Set XD_Conn=obj_Conn
End Property

'================================================================
'GetSQL   �õ���ѯ���
'
'================================================================
Public Property Let GetSQL(str_sql)
 XD_SQL=str_sql
End Property

 

'==================================================================
'Class_Initialize ��ĳ�ʼ��
'��ʼ����ǰҳ��ֵ
'
'================================================================== 
Private Sub Class_Initialize
 '========================
 '�趨һЩ�������a��ֵ
 '========================
 XD_PageSize=10  '�趨��ҳ��Ĭ��ֵΪ10
 '========================
 '��ȡ��ǰ���ֵ
 '========================
 If request("page")="" Then
  int_curpage=1
 ElseIf not(IsNumeric(request("page"))) Then
  int_curpage=1
 ElseIf CInt(Trim(request("page")))<1 Then
  int_curpage=1
 Else
  Int_curpage=CInt(Trim(request("page")))
 End If
  
End Sub

'====================================================================
'ShowPage  ������ҳ������
'����ҳ��ǰһҳ����һҳ��ĩҳ���������ֵ���
'
'====================================================================
Public Sub ShowPage()
 Dim str_tmp
 XD_sURL = GetUrl()
 int_totalRecord=XD_RS.RecordCount
 If int_totalRecord<=0 Then
  str_error=str_error & "�ܼ�¼��Ϊ0"
  Call ShowError()
 End If
 If int_totalRecord="" then
     int_TotalPage=1
 Else
  'If int_totalRecord mod PageSize =0 Then
   'int_TotalPage = CLng(int_TotalRecord / XD_PageSize * -1)*-1
  'Else
   'int_TotalPage = CLng(int_TotalRecord / XD_PageSize * -1)*-1+1
  'End If
  int_TotalPage=XD_RS.pagecount
 End If
 
 If Int_curpage>int_Totalpage Then
  int_curpage=int_TotalPage
 End If
 
 '==================================================================
 '��ʾ��ҳ��Ϣ������ģ������Լ�Ҫ���������λ��
 '==================================================================
 str_tmp=ShowFirstPrv
 response.write str_tmp
 str_tmp=showNumBtn
 response.write str_tmp
 str_tmp=ShowNextLast
 response.write str_tmp
 str_tmp=ShowPageInfo
 response.write str_tmp
End Sub

'====================================================================
'ShowFirstPrv  ��ʾ��ҳ��ǰһҳ
'
'
'====================================================================
Private Function ShowFirstPrv()
 Dim Str_tmp,int_prvpage
 If int_curpage=1 Then
  str_tmp="<span class=""pageindex""><img src=""images/Page_First_0.gif"" border=""0""></span>" & VbCrLf
  str_tmp=str_tmp&"<span class=""pageindex""><img src=""images/Page_Previous_0.gif"" border=""0""></span>" & VbCrLf
 Else
  int_prvpage=int_curpage-1
  str_tmp="<span class=""page""><a href="""&XD_sURL & "1" & """><img src=""images/Page_First.gif"" border=""0""></a></span>" & VbCrLf
  str_tmp=str_tmp&"<span class=""page""><a href=""" & XD_sURL & CStr(int_prvpage) & """><img src=""images/Page_Previous.gif"" border=""0""></a></span>" & VbCrLf
 End If
 ShowFirstPrv=str_tmp
End Function

'====================================================================
'ShowNextLast  ��һҳ��ĩҳ
'
'
'====================================================================
Private Function ShowNextLast()
 Dim str_tmp,int_Nextpage
 If Int_curpage>=int_totalpage Then
  str_tmp="<span class=""pageindex""><img src=""images/Page_Next_0.gif"" border=""0""></span>" & VbCrLf
  str_tmp=str_tmp&"<span class=""pageindex""><img src=""images/Page_Last_0.gif"" border=""0""></span>" & VbCrLf
 Else
  Int_NextPage=int_curpage+1
  str_tmp="<span class=""page""><a href=""" & XD_sURL & CStr(int_nextpage) & """><img src=""images/Page_Next.gif"" border=""0""></a></span>" & VbCrLf
  str_tmp=str_tmp&"<span class=""page""><a href="""& XD_sURL & CStr(int_totalpage) & """><img src=""images/Page_Last.gif"" border=""0""></a></span>" & VbCrLf
 End If
 ShowNextLast=str_tmp
End Function

'==================================================================== 
'ShowListPage �б��� 
' 
' 
'==================================================================== 
Private Function ShowListPage()
	dim goi
	If int_curpage=int_totalpage then
		goi=int_curpage
	else
		goi=int_curpage+1
	end if
	ShowListPage=str_tmp & "<span class=""page""><Input Type=text size=2 maxlength=3 value='" & goi & "' onmouseover='this.focus();this.select()' Name='PageNum' id='PageNum'><Input Type=button id=go name=go value='GO' onclick=""javascript:try{if(document.all.PageNum.value>0 && document.all.PageNum.value<=" & i & "){window.location='" &  XD_sURL & "'+document.all.PageNum.value+'';}}catch(e){}"" onmouseover='this.focus()' onfocus='this.blur()'></span>"
End Function 

'====================================================================
'ShowNumBtn  ���ֵ���
'
'
'====================================================================
Function showNumBtn()
Dim i,str_tmp,end_page,start_page

start_page=1
if int_curpage=0 then
str_tmp=str_tmp&"<span  class=""current"">0</span>" & VbCrLf
else
if int_curpage>1 then
start_page=int_curpage
if (int_curpage<=5) then
start_page=1
end if
if (int_curpage>5) then
start_page=int_curpage-2
end if
end if
end_page=start_page+5
if end_page>int_totalpage then
end_page=int_totalpage
end if
For i=start_page to end_page
strTemp=XD_sURL & CStr(i)
  if i=int_curpage then
  str_tmp=str_tmp & "<span  class=""current"" style=""background-color: #78A6D1;margin:0 1px;padding:1px 6px 3px 6px;border:1px solid #bbdded;color:#ffffff;"">"&i&"</span>" & VbCrLf
  else
  str_tmp=str_tmp & "<span  class=""page""><a href=""" & XD_sURL & CStr(i) & """>"&i&"</a></span>" & VbCrLf
  end if
Next
end if
showNumBtn=str_tmp
End Function
'====================================================================
'ShowPageInfo  ��ҳ��Ϣ
'����Ҫ�������޸�
'
'====================================================================
Private Function ShowPageInfo()
 Dim str_tmp
 str_tmp="ҳ��:"&int_curpage&"/"&int_totalpage&"ҳ ��<font color=""#009900""><b> "&int_totalrecord&" </b></font>����¼"

' str_tmp="<TD class=""page_css_3"">ҳ��:"&int_curpage&"/"&int_totalpage&"ҳ ��<font color=""#009900""><b> "&int_totalrecord&" </b></font>����¼ "&XD_PageSize&"��/ҳ</TD>"

 ShowPageInfo=str_tmp
End Function
'==================================================================
'GetURL  �õ���ǰ��URL
'����URL������ͬ����ȡ��ͬ�Ľ��
'
'==================================================================
Private Function GetURL()
 Dim strurl,str_url,i,j,search_str,result_url
 search_str="page="
 
 strurl=Request.ServerVariables("URL")
 Strurl=split(strurl,"/")
 i=UBound(strurl,1)
 str_url=strurl(i)'�õ���ǰҳ�ļ���
 
 str_params=Trim(Request.ServerVariables("QUERY_STRING"))
 If str_params="" Then
  result_url=str_url & "?page="
 Else
  If InstrRev(str_params,search_str)=0 Then
   result_url=str_url & "?" & str_params &"&page="
  Else
   j=InstrRev(str_params,search_str)-2
   If j=-1 Then
    result_url=str_url & "?page="
   Else
    str_params=Left(str_params,j)
    result_url=str_url & "?" & str_params &"&page="
   End If
  End If
 End If
 GetURL=result_url
End Function

'====================================================================
' ���� Terminate �¼���
'
'====================================================================
Private Sub Class_Terminate  
 XD_RS.close
 Set XD_RS=nothing
End Sub
'====================================================================
'ShowError  ������ʾ
'
'
'====================================================================
Private Sub ShowError()
 If str_Error <> "" Then
  Response.Write("" & str_Error & "")
  Response.End
 End If
End Sub
End class
%>