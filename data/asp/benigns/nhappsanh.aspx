<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/hcmpcadmin.master" CodeBehind="nhappsanh.aspx.vb" Inherits="hcmpc.nhappsanh" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" src="./ckeditor/ckeditor.js" type="text/javascript"></script>
    <script type="text/javascript">
        function isFormValid() {
            var txtTitle = document.getElementById("<%=txtTitle.ClientID %>");

            if (txtTitle.value == '') {
                alert("Vui lòng nhập tiêu đề");
                txtTitle.focus();
                return false;
            }

            return true;
        }    
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="toolbar-box">
	<div class="m">
		<div id="toolbar" class="toolbar-list">
            <ul>
                <li id="toolbar-apply" class="button">
                <a class="toolbar" href="#" onclick="if(isFormValid()) javascript:__doPostBack('<%= btnLuu.UniqueID %>','')">
                <span class="icon-32-apply">
                </span>
                Lưu
                </a>
                </li>

                <li id="toolbar-save" class="button">
                <a class="toolbar" href="#" onclick="if(isFormValid()) javascript:__doPostBack('<%= btnLuuThoat.UniqueID %>','')">
                <span class="icon-32-save">
                </span>
                Lưu và thoát
                </a>
                </li>

                <li id="toolbar-save-new" class="button">
                <a class="toolbar" href="#" onclick="if(isFormValid()) javascript:__doPostBack('<%= btnLuuMoi.UniqueID %>','')">
                <span class="icon-32-save-new">
                </span>
                Lưu &amp; thêm mới
                </a>
                </li>

                <li id="toolbar-cancel" class="button">
                <a class="toolbar" href="dspsanh.aspx">
                <span class="icon-32-cancel">
                </span>
                Hủy bỏ
                </a>
                </li>

                <li class="divider">
                </li>

                <li id="toolbar-help" class="button">
                <a class="toolbar" rel="help" href="#">
                <span class="icon-32-help">
                </span>
                Trợ giúp
                </a>
                </li>

            </ul>
            <div class="clr"></div>
            </div>
					<div class="pagetitle icon-48-article-add"><h2>Quản lý bài viết: <%=IIf(Request("ID") = "", "Viết bài mới", "Chỉnh sửa bài viết")%></h2></div>
			</div>
</div>
<div id="system-message-container">            
    <asp:PlaceHolder ID="msg" runat="server">                
    </asp:PlaceHolder>     
</div>
<div id="element-box" style="font-size:12px;">
    <div class="m">
        <table border="0" width="100%" cellspacing="5">            
            <tr>
                <td width="100">
                    Thể loại          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    <telerik:RadComboBox ID="cboCat" Runat="server" Width="300" AutoPostBack="true"></telerik:RadComboBox>          
                </td>
            </tr>
            <tr>
                <td>
                    Tiêu đề <span style="color:Red">*</span>         
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtTitle" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Nội dung ngắn        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtIntroText" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td>
                    Tác Giả        
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                   <asp:TextBox ID="txtAuthor" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Tác giả bài viết          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>                    
                    <telerik:RadComboBox runat="server" ID="cboTGBaiViet" Filter="Contains" EnableLoadOnDemand="True" 
                                        DataTextField="HoTen"
                                        DataValueField="AuthorID" HighlightTemplatedItems="true" Width="300px" /> 
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="tacgia.aspx">Thêm tác giả mới</a>         
                </td>
            </tr>
             <tr>
                <td>
                    Tác giả hình ảnh          
                </td>
                <td>
                    &nbsp;
                </td>
                <td>                    
                    <telerik:RadComboBox runat="server" ID="cboTGHinhAnh" Filter="Contains" EnableLoadOnDemand="True" 
                                        DataTextField="HoTen"
                                        DataValueField="AuthorID" HighlightTemplatedItems="true" Width="300px" />          
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <p style="margin-left:0px;">Soạn thảo nội dung bài viết:</p>
                    <asp:TextBox ID="txtFullText" TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr style="display:none">
                <td>
                      
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="right">
                   <asp:Button ID="btnLuu" runat="server" Width="80" Text="Lưu"></asp:Button>
                   <asp:Button ID="btnLuuThoat" runat="server" Width="80" Text="LưuThoat"></asp:Button>
                   <asp:Button ID="btnLuuMoi" runat="server" Width="80" Text="LưuMoi"></asp:Button>
                </td>
            </tr>

            <tr>
                <td colspan="3">
                     <div>
    <link rel="stylesheet" href="css/grid.css" type="text/css" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <telerik:RadGrid ID="mygrid" runat="server" AutoGenerateColumns="False" GridLines="None"
                    AllowPaging="True" AllowSorting="True" PageSize="10" AllowMultiRowSelection="true">
                    <MasterTableView DataKeyNames="PSAnh_ID">                
                     <Columns>
                           <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                               <HeaderStyle Width="50px" HorizontalAlign="Center" />
                               <ItemStyle HorizontalAlign="Center" />
                           </telerik:GridClientSelectColumn>

                            <telerik:GridBoundColumn DataField="PSAnh_ID" HeaderText="PSAnh_ID" UniqueName="PSAnh_ID"
                                Visible="false">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="Content_Text" HeaderText="Tiêu Đề">    
                                <HeaderStyle HorizontalAlign="Left" Font-Bold="true" />     
                                <ItemStyle HorizontalAlign="Left" />                                              
                            </telerik:GridBoundColumn>              
                            <telerik:GridBoundColumn DataField="HinhAnh" HeaderText="Hình Ảnh">    
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" Width="50" />     
                                <ItemStyle HorizontalAlign="Center" />                                              
                            </telerik:GridBoundColumn>              
                            <telerik:GridButtonColumn CommandName="DuyetArticle" DataTextField="HienThi" Text="DuyetArticle"
                                UniqueName="DuyetArticle" HeaderText="Xuất bản">
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100" />
                            </telerik:GridButtonColumn>
                            <telerik:GridButtonColumn CommandName="XoaArticle" DataTextField="Xoa" Text="DuyetArticle"
                                UniqueName="XoaArticle" HeaderText="Xóa">
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" />
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100" />
                            </telerik:GridButtonColumn>
                        </Columns>
                        <NoRecordsTemplate>
                            <p align="center" style="color:Red; padding-top:10px;">Không có dòng dữ liệu nào được tìm thấy.</p>
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                           <Selecting AllowRowSelect="true" />           
                     </ClientSettings>
                </telerik:RadGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
     
                </td>
            </tr>
    
            <tr>
                <td align="left">
                    Mô tả  
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="left">
                   <asp:TextBox ID="txtContent_Text" TextMode="SingleLine" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                   Hình nhỏ
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="left">
                   <asp:FileUpload ID="upFile" runat="server" />                   
                </td>
            </tr>
            <tr>
                <td align="left">
                    Hình lớn hoặc video  
                </td>
                <td>
                    &nbsp;
                </td>
                <td align="left">
                   <asp:FileUpload ID="upFile1" runat="server" />
                   <asp:Button ID="btnUpload" runat="server" Width="80" Text="Upload"></asp:Button>
                </td>
            </tr>

        </table>
    </div>

 </div>

<script type="text/javascript">    CKEDITOR.replace('<%=txtFullText.ClientID %>'); </script>
</asp:Content>
