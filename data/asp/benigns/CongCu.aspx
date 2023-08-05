<%@ Page Title="Trang công cụ hỗ trợ" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout/mainLayout.Master" CodeBehind="CongCu.aspx.vb" Inherits="QuanLyThi.CongCu" %>
<%@ Register TagPrefix="uc" TagName="CH" Src="~/Controls/Tool/ucNganHangCauHoi.ascx" %>
<%@ Register TagPrefix="uc" TagName="EX" Src="~/Controls/Tool/ucToolExcel.ascx" %>
<%@ Register TagPrefix="uc" TagName="ER" Src="~/Controls/Tool/ucXoaBaiThi.ascx" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<div>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="mlPageTool"
        Skin="WebBlue">
        <Tabs>
            <telerik:RadTab runat="server" Text="Ngân hàng câu hỏi">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Tool chuyển excel">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Tool xóa bài thi">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="mlPageTool" Runat="server" SelectedIndex="0">
        <telerik:RadPageView id="RadPageView1" runat="server"><uc:CH ID="ctrCauHoi" runat="server" /></telerik:RadPageView>
        <telerik:RadPageView id="RadPageView2" runat="server"><uc:EX ID="ctrlExcel" runat="server" /></telerik:RadPageView>
        <telerik:RadPageView id="RadPageView3" runat="server"><uc:ER ID="ctrlXoa" runat="server" /></telerik:RadPageView>
    </telerik:RadMultiPage>
  </div>
 </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

            
