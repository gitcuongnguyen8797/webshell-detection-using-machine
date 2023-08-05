<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="Embassy.aspx.cs" Inherits="QLDoiTacQuocTe.Embassy" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxFormLayout" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Height="500px" Theme="Aqua" Width="100%" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged" OnInit="ASPxPageControl1_Init">
        <TabPages>
            <dx:TabPage Name="tabCountry" Text="Country">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 117px">Country Name</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtCountryName" runat="server" Height="16px" Theme="Aqua" Width="389px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 117px">Flag</td>
                                <td>
                                    <dx:ASPxImage ID="ASPxImage1" runat="server" Height="160px" Width="240px">
                                    </dx:ASPxImage>

                                    <br />
                                    <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" Width="100%">
                                    </dx:ASPxUploadControl>
                                    <dx:ASPxButton ID="btnUploadImage" runat="server" OnClick="btnUploadImage_Click" Text="Upload Image">
                                    </dx:ASPxButton>

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 117px">Infomation</td>
                                <td>
                                    <asp:TextBox ID="txtCountryInfo" runat="server" Height="138px" TextMode="MultiLine" Width="363px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 117px">&nbsp;</td>
                                <td>
                                    <dx:ASPxButton ID="btnCountrySave" runat="server" Text="Save" OnClick="btnCountrySave_Click">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="tabEmbassy" Text="Embassy">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <table style="width: 100%; height: 382px; border-style: none; border-width: 2px">
                            <tr>
                                <td style="width: 168px">Address</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmAddress" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Phone</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmPhone" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Fax</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmFax" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Email</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmEmail" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Contact Name</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmContactName" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Contact Email</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmContactEmail" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Contact Phone Number</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmContactPhone" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Other Infomation</td>
                                <td>
                                    <dx:ASPxMemo ID="txtEmOtherInfo" runat="server" Height="131px" Width="328px">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px; height: 27px;"></td>
                                <td style="height: 27px">
                                    <dx:ASPxButton ID="btnEmSave" runat="server" OnClick="btnEmSave_Click" Text="Save">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="tabConsulate" Text="Consulate">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <table style="border-style: none; border-width: 2px; width: 100%; height: 382px;">
                            <tr>
                                <td style="width: 168px; ">Address</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmAddress0" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Phone</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmPhone0" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Fax</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmFax0" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Email</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmEmail0" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Contact Name</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmContactName0" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Contact Email</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmContactEmail0" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Contact Phone Number</td>
                                <td>
                                    <dx:ASPxTextBox ID="txtEmContactPhone0" runat="server" Width="170px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px">Other Infomation</td>
                                <td>
                                    <dx:ASPxMemo ID="txtEmOtherInfo0" runat="server" Height="131px" Width="328px">
                                    </dx:ASPxMemo>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 168px; height: 27px;"></td>
                                <td style="height: 27px">
                                    <dx:ASPxButton ID="btnEmSave0" runat="server" OnClick="btnEmSave0_Click" Text="Save">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="tabPartner" Text="Partners">
                <ContentCollection>
                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                        <span style="color: #0000FF; font-family: Tahoma; font-size: medium"><strong>List of Partners</strong></span><br />
                        <dx:ASPxGridView ID="GridViewPartner" runat="server" AutoGenerateColumns="True"
                            Width="100%" Theme="Aqua" OnDataBinding="GridViewPartner_DataBinding" OnFocusedRowChanged="GridViewPartner_FocusedRowChanged" OnSelectionChanged="GridViewPartner_SelectionChanged">
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
                                    <dx:ASPxButton ID="btnLoadPartner" runat="server" AutoPostBack="False" OnClick="btnLoadPartner_Click" Text="Load Partner Info">
                                    </dx:ASPxButton>
                                </td>
                                <td style="border-bottom-style: solid; border-bottom-color: #0000FF">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <span style="color: #0000FF; font-family: Tahoma; font-size: medium"><strong>Partner Detail Infomation</strong></span><br />
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 300px; margin-left: 40px;">
                                    Logo<br />
                                    <dx:ASPxImage ID="ASPxImagePartnerLogo" runat="server" Height="240px" Width="320px">
                                    </dx:ASPxImage>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 300px; margin-left: 40px;">
                                    <dx:ASPxUploadControl ID="ASPxUploadPartnerLogo" runat="server" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" Width="100%">
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
                                    <dx:ASPxButton ID="btnPartnerSave" runat="server"  Text="Save" OnClick="btnPartnerSave_Click">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>
