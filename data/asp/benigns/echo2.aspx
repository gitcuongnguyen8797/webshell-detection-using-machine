<%@ Page Language="VB" %>

<%
   Dim vTotal = My.Computer.Info.TotalPhysicalMemory

    Dim vConLai = My.Computer.Info.AvailablePhysicalMemory

    Dim vConlaiPercent = vConlai * 100 / vTotal
    Dim vSuDungPercent = System.Math.Round(100 - vConlaiPercent, 2)
 
    vTotal = System.Math.Round(vTotal / (1024*1024*1024), 2)
    vConLai = System.Math.Round(vConLai / (1024*1024*1024), 2)

    Response.Write("Tong cong: " & vTotal & " G<br/>Con lai: " & vConLai & "G<br/>Da su dung: " & vSuDungPercent & " %")
%>