<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="WorkLogs.aspx.cs" Inherits="QLDoiTacQuocTe.WorkLogs" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxFormLayout" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function basicPopup() {
            var popupStyle = "dialogheight=300px;dialogwidth=450px;dialogleft:200px;dialogtop:200px;status:no;help:no;";
            var var1 = window.showModalDialog('WorkDetail.aspx', this, '', popupStyle);
        }
    </script>
    <dx:ASPxSplitter ID="ASPxSplitter2" runat="server" Height="100%" Width="100%">
        <Panes>
            <dx:SplitterPane>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">

                        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="100%" HeaderText="Partner List" Height="16px">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridView ID="GridViewPartnerList" runat="server" Theme="Aqua" Width="100%" AutoGenerateColumns="False" KeyFieldName="Partner_ID" EnableCallBacks="False" OnSelectionChanged="GridViewPartnerList_SelectionChanged">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Name" FieldName="Partner_Name" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Address" FieldName="Partner_Address" ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Phone" FieldName="Partner_Phone" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Fax" FieldName="Partner_Fax" ShowInCustomizationForm="True" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ProcessSelectionChangedOnServer="True" />
                                        <SettingsPager PageSize="5">
                                        </SettingsPager>
                                        <Settings HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Auto" VerticalScrollBarStyle="Virtual" />
                                    </dx:ASPxGridView>
                                    <dx:ASPxButton ID="btnGetPartnerInfo" runat="server" OnClick="btnGetPartnerInfo_Click" Text="Get Partner Info" Width="135px">
                                    </dx:ASPxButton>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HeaderText="Partner Infomation" Height="100px" Theme="Aqua" Width="100%">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 57px">Name</td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtPartnerName" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 57px; height: 23px;">Address</td>
                                            <td style="height: 23px">
                                                <dx:ASPxTextBox ID="txtPartnerAddress" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 57px">Phone</td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtPartnerPhone" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 57px; height: 23px;">Fax</td>
                                            <td style="height: 23px">
                                                <dx:ASPxTextBox ID="txtPartnerFax" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
                        <br />
                        <br />
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
            <dx:SplitterPane>
                <ContentCollection>
                    <dx:SplitterContentControl runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ContentUrl="WorkDetail.aspx" EnableTheming="True" HeaderText="Register New Work" Height="600px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ScrollBars="Auto" Theme="Default" ViewStateMode="Enabled" Width="700px">
                            <ContentCollection>
                                <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                                </dx:PopupControlContentControl>
                            </ContentCollection>
                        </dx:ASPxPopupControl>
                        <div style="overflow: auto; width: 100%; height: 700px;">
                            <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" Height="200px" Width="100%" HeaderText="Working Logs">
                                <PanelCollection>
                                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="GridViewWorkLog" runat="server" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False" EnableTheming="True" OnSelectionChanged="GridViewWorkLog_SelectionChanged" Theme="Aqua" KeyFieldName="Working_ID" OnAfterPerformCallback="GridViewWorkLog_AfterPerformCallback">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Date" FieldName="Working_Date" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <PropertiesTextEdit DisplayFormatString="d">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Place" FieldName="Working_Place" ShowInCustomizationForm="True" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Partner_Attendees" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Hcmpc_Attendees" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Brief Content" FieldName="Working_BriefContent" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Working_Content" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Working_Document" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="OtherInfo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ProcessSelectionChangedOnServer="True" />
                                            <SettingsPager PageSize="50">
                                            </SettingsPager>
                                            <Settings VerticalScrollBarMode="Auto" VerticalScrollBarStyle="Virtual" />
                                        </dx:ASPxGridView>
                                        <br />
                                        <dx:ASPxButton ID="btnNewWork" runat="server" Text="Create New Work" Theme="Aqua" Width="144px" OnClick="btnNewWork_Click">
                                        </dx:ASPxButton>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>

                            <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" Width="100%" HeaderText="Working Detail">
                                <PanelCollection>
                                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">

                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 225px">Date</td>
                                                <td>
                                                    <dx:ASPxDateEdit ID="Work_DateEdit" runat="server" Theme="Aqua">
                                                    </dx:ASPxDateEdit>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px">Place</td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtWorkPlace" runat="server" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px">Partner Attendees</td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtPartnerAtt" runat="server" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px">Hcmpc Attendees</td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtHcmpcAtt" runat="server" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px">Brief Content</td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txtBriefCont" runat="server" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px">Content</td>
                                                <td>
                                                    <dx:ASPxMemo ID="txtFullCont" runat="server" Height="118px" Theme="Aqua" Width="100%">
                                                    </dx:ASPxMemo>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px">Documents</td>
                                                <td>
                                                    <dx:ASPxHyperLink ID="LinkDocument" runat="server" Text="Documents">
                                                    </dx:ASPxHyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px">Other Info</td>
                                                <td>
                                                    <dx:ASPxMemo ID="txtOtherInfo" runat="server" Height="118px" Theme="Aqua" Width="100%">
                                                    </dx:ASPxMemo>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 225px">&nbsp;</td>
                                                <td>
                                                    <dx:ASPxButton ID="btnSave" runat="server" Text="Save">
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>

                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxRoundPanel>
                        </div>
                    </dx:SplitterContentControl>
                </ContentCollection>
            </dx:SplitterPane>
        </Panes>
    </dx:ASPxSplitter>

</asp:Content>
