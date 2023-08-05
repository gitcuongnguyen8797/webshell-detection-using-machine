<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Partner.aspx.cs" Inherits="QLDoiTacQuocTe.Partner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <span style="color: #0000FF; font-family: Tahoma; font-size: medium"><strong>List of Partners</strong></span><br />
    <dx:ASPxGridView ID="GridViewPartner" runat="server" AutoGenerateColumns="True"
        Width="100%" Theme="Aqua" OnDataBinding="GridViewPartner_DataBinding" OnFocusedRowChanged="GridViewPartner_FocusedRowChanged" OnSelectionChanged="GridViewPartner_SelectionChanged" EnableCallBacks="False">
        <%-- DXCOMMENT: Configure ASPxGridView's columns in accordance with datasource fields --%>
        <Columns>
            <dx:GridViewDataTextColumn Caption="ID" FieldName="Partner_ID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Name" FieldName="Partner_Name" ShowInCustomizationForm="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Address" FieldName="Partner_Address" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Phone" FieldName="Partner_Phone" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Fax" FieldName="Partner_Fax" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ProcessSelectionChangedOnServer="True"></SettingsBehavior>
        <SettingsPager PageSize="5" />
        <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="150" VerticalScrollBarStyle="Virtual" />
        <Paddings Padding="0px" />
        <Border BorderWidth="1px" />
        <BorderBottom BorderWidth="1px" />
    </dx:ASPxGridView>
    <table style="width: 100%">
        <tr>
            <td style="width: 121px; border-bottom-style: solid; border-bottom-color: #0000FF">
                                    <dx:ASPxButton runat="server" AutoPostBack="False" Text="Register New Partner" ID="btnLoadPartner" OnClick="btnLoadPartner_Click" Height="20px" Width="146px"></dx:ASPxButton>

                                </td>
            <td style="border-bottom-style: solid; border-bottom-color: #0000FF">
                <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ContentUrl="~/NewPartner.aspx" Height="600px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" Text="Register Partner Information" Theme="BlackGlass" Width="700px">
                </dx:ASPxPopupControl>
            </td>
        </tr>
    </table>
    <br />
    <span style="color: #0000FF; font-family: Tahoma; font-size: medium"><strong>Partner Detail Infomation</strong></span><br />
    <table style="width: 100%">
        <tr>
            <td style="width: 300px; margin-left: 40px;">Logo<br />
                <dx:ASPxImage ID="ASPxImagePartnerLogo" runat="server" Height="240px" Width="320px">
                </dx:ASPxImage>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 300px; margin-left: 40px;">
                <dx:ASPxUploadControl ID="ASPxUploadPartnerLogo" runat="server"  Width="100%">
                </dx:ASPxUploadControl>
            </td>
            <td>
                <dx:ASPxButton ID="btnUploadPartnerLogo" runat="server" OnClick="btnUploadPartnerLogo_Click" Text="Upload Image">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <table style="width: 100%">
        <tr>
            <td style="width: 173px">Partner Name</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerName" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px; height: 23px;">Partner Address</td>
            <td style="height: 23px">
                <dx:ASPxTextBox ID="txtPartnerAddress" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Partner Phone</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerPhone" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Parter Fax</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerFax" runat="server" Width="100%">
                </dx:ASPxTextBox>

            </td>
        </tr>
        <tr>
            <td style="width: 173px">Email</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerEmail" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Website</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerWebsite" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Sector</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerSector" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Product</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerProduct" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Contact Name</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerContactName" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Contact Phone</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerContactPhone" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Contact Email</td>
            <td>
                <dx:ASPxTextBox ID="txtPartnerContactEmail" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 173px">Other Infomation</td>
            <td>
                <dx:ASPxMemo ID="txtPartnerOtherInfo" runat="server" Height="71px" Theme="Aqua" Width="100%">
                </dx:ASPxMemo>
            </td>
        </tr>
        <tr>
            <td style="width: 168px; height: 27px;"></td>
            <td style="height: 27px">
                <dx:ASPxButton ID="btnPartnerSave" runat="server" Text="Save" OnClick="btnPartnerSave_Click">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>

</asp:Content>
