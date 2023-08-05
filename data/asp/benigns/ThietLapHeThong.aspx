<%@ Page Title="Trang thiết lập hệ thống" Language="vb" AutoEventWireup="false" CodeBehind="ThietLapHeThong.aspx.vb" Inherits="QuanLyThi.ThietLapHeThong" MasterPageFile="~/Layout/mainLayout.Master" %>
<%@ Register TagPrefix="uc" TagName="DoiTuong" Src="~/Controls/Setup/ThietLapDoiTuong.ascx" %>
<%@ Register TagPrefix="uc" TagName="CuocThi" Src="~/Controls/Setup/ThietLapCuocThi.ascx" %>
<%@ Register TagPrefix="uc" TagName="BaiThi" Src="~/Controls/Setup/ThietLapBaiThi.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="mainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div>
<asp:UpdatePanel runat="server"><ContentTemplate>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" SelectedIndex="0" MultiPageID="mlPageTool"
        Skin="WebBlue">
        <Tabs>
            <telerik:RadTab runat="server" Text="Thiết lập đối tượng" Selected="True" 
                Visible="False">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Thiết lập bài thi">
            </telerik:RadTab>
            <telerik:RadTab runat="server" Text="Thiết lập cuộc thi">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage ID="mlPageTool" Runat="server" SelectedIndex="1">
        <!--<telerik:RadPageView id="RadPageView1" runat="server"><uc:DoiTuong runat="server" /></telerik:RadPageView>-->
        <telerik:RadPageView id="RadPageView2" runat="server"><uc:BaiThi runat="server" /></telerik:RadPageView>
        <telerik:RadPageView id="RadPageView3" runat="server"><uc:CuocThi runat="server" /></telerik:RadPageView>
    </telerik:RadMultiPage>
</ContentTemplate></asp:UpdatePanel>
</div>
</asp:Content>
