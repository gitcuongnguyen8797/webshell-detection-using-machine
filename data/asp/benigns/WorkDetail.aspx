<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkDetail.aspx.cs" Inherits="QLDoiTacQuocTe.WorkDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 432px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel4" runat="server" Width="100%" HeaderText="Working Detail">
                            <PanelCollection>
                                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 225px">Create new work with</td>
                                            <td colspan="2">
                                                <dx:ASPxTextBox ID="txtWorkPartner" runat="server" Enabled="False" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">Date</td>
                                            <td colspan="2">
                                                <dx:ASPxDateEdit ID="Work_DateEdit" runat="server" Theme="Aqua" AutoPostBack="True" EditFormat="DateTime">
                                                    <ClientSideEvents ButtonClick="function(s, e) {
	var weeks = s.GetValue();	
	alert(weeks)	
}" />
                                                </dx:ASPxDateEdit>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">Place</td>
                                            <td colspan="2">
                                                <dx:ASPxTextBox ID="txtWorkPlace" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">Partner Attendees</td>
                                            <td colspan="2">
                                                <dx:ASPxTextBox ID="txtPartnerAtt" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">Hcmpc Attendees</td>
                                            <td colspan="2">
                                                <dx:ASPxTextBox ID="txtHcmpcAtt" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">Brief Content</td>
                                            <td colspan="2">
                                                <dx:ASPxTextBox ID="txtBriefCont" runat="server" Width="100%">
                                                </dx:ASPxTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">Content</td>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="txtFullCont" runat="server" Height="118px" Theme="Aqua" Width="100%">
                                                </dx:ASPxMemo>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">Documents</td>
                                            <td aria-multiline="False" aria-orientation="vertical" class="auto-style1">
                                                <dx:ASPxUploadControl ID="UploadControl1" runat="server" Theme="Aqua" Width="280px">
                                                </dx:ASPxUploadControl>
                                            </td>
                                            <td aria-multiline="False" aria-orientation="vertical">
                                                <dx:ASPxHyperLink ID="LinkDocument" runat="server" Text="Documents">
                                                </dx:ASPxHyperLink>
                                                <dx:ASPxButton ID="btnWorkUpload" runat="server" OnClick="btnWorkUpload_Click" Text="Upload">
                                                </dx:ASPxButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">Other Info</td>
                                            <td colspan="2">
                                                <dx:ASPxMemo ID="txtOtherInfo" runat="server" Height="118px" Theme="Aqua" Width="100%">
                                                </dx:ASPxMemo>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 225px">&nbsp;</td>
                                            <td colspan="2">
                                                <dx:ASPxButton ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click">
                                                </dx:ASPxButton>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxRoundPanel>
    </form>
</body>
</html>
