<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/vanhanh.master" CodeBehind="ip.aspx.vb" Inherits="caothe.ip" 
    title="IP" %>
    
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="StyleIP.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<SCRIPT Language= "VBScript" RUNAT=SERVER> 
  Result = Findanswer(15) 
  Document.Write ("The answer is " &Result) 

  Function Findanswer(x)  
  'This statement generates a run-time error. 
   Findanswer = x/0       
  End Function 
</SCRIPT> 

<table width="500px" align="center">
<tr>
<td align="left">
    <telerik:RadFormDecorator ID="QsfFromDecorator" runat="server" DecoratedControls="All" EnableRoundedCorners="false" />
    <div class="bigModule">
        <div class="bigModuleBottom">
            <ul style="margin-top: 0; list-style: none">
                <li style="float: left; margin-right: 30px;"><span style="width: 20px; margin-right: 5px;
                    background: #93b45c; display: block; border: solid 1px #5c5c5c; float: left">&nbsp;</span>
                    Most Visited</li>
                <li style="float: left; margin-right: 30px;"><span style="width: 20px; margin-right: 5px;
                    background: #c25a51; display: block; border: solid 1px #5c5c5c; float: left">&nbsp;</span>
                    Latest Post</li>
                <li><span style="width: 20px; background: #4f84bf; display: block; margin-right: 5px;
                    border: solid 1px #5c5c5c; float: left">&nbsp;</span> Most Replies</li>
            </ul>
        </div>
    </div>
    <telerik:RadTreeView runat="server" ID="RadTreeView1">
    </telerik:RadTreeView>
    <telerik:RadTreeView runat="server" ID="RadTreeView2" Visible=false>
        <Nodes>
            <telerik:RadTreeNode Text="Community Forums" Expanded="true">
                <Nodes>
                    <telerik:RadTreeNode Text="Desktop Technologies" Expanded="true">
                        <Nodes>
                            <telerik:RadTreeNode Text="2007 Microsoft Office System" CssClass="latestPost">
                            </telerik:RadTreeNode>
                            <telerik:RadTreeNode Text="Microsoft Office 2003" CssClass="mostVisited">
                            </telerik:RadTreeNode>
                            <telerik:RadTreeNode Text="Microsoft Office XP" CssClass="mostReplies">
                            </telerik:RadTreeNode>
                        </Nodes>
                    </telerik:RadTreeNode>
                    <telerik:RadTreeNode Text="Web Technologies" Expanded="true">
                        <Nodes>
                            <telerik:RadTreeNode Text="ASP.NET" Expanded="true">
                                <Nodes>
                                    <telerik:RadTreeNode Text="General ASP.NET" CssClass="mostVisited">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode Text="ASP.NET AJAX" CssClass="latestPost">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode Text="Advanced ASP.NET" CssClass="mostReplies">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode Text="Source Projects">
                                    </telerik:RadTreeNode>
                                </Nodes>
                            </telerik:RadTreeNode>
                            <telerik:RadTreeNode Text="Silverlight" CssClass="latestPost">
                            </telerik:RadTreeNode>
                        </Nodes>
                    </telerik:RadTreeNode>
                </Nodes>
            </telerik:RadTreeNode>
        </Nodes>
    </telerik:RadTreeView>
</td>
</tr>
</table>

<telerik:RadSkinManager ID="QsfSkinManager" runat="server" ShowChooser="true" Visible="false" />

<center>
<asp:Label ID="lbMessage" runat="server"></asp:Label>
</center>

</asp:Content>
