<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxRoundPanel1.Enabled = !chbDisabled.Checked;
        ASPxRoundPanel1.View = (DevExpress.Web.ASPxRoundPanel.View)Enum.Parse(typeof(DevExpress.Web.ASPxRoundPanel.View), 
                cbxViewMode.Value.ToString());
        ASPxRoundPanel1.ShowHeader = cbShowHeader.Checked;
        ASPxRoundPanel1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxRoundPanel1.RightToLeft;
            
        ASPxRoundPanel1.Controls.Add(new LiteralControl("Sample Content"));
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<DevExpress.Web.ASPxRoundPanel.View>("View", delegate(DevExpress.Web.ASPxRoundPanel.View value) { cbxViewMode.Value = Enum.GetName(typeof(DevExpress.Web.ASPxRoundPanel.View), value); }, DevExpress.Web.ASPxRoundPanel.View.Standard);
        LoadOption<bool>("ShowHeader", delegate(bool value) { cbShowHeader.Checked = value; }, true);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<DevExpress.Web.ASPxRoundPanel.View>("View", delegate() { return (DevExpress.Web.ASPxRoundPanel.View)Enum.Parse(typeof(DevExpress.Web.ASPxRoundPanel.View), cbxViewMode.Value.ToString()); });
        SaveOption<bool>("ShowHeader", delegate() { return cbShowHeader.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server"
        ShowHeader="true">
    </dx:ASPxRoundPanel>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="phOptions" runat="server">
     <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblViewMode" runat="server" SkinID="Option" CssClass="label" Text="View:"
                    AssociatedControlID="cbxViewMode">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxViewMode" SkinID="Option" CssClass="editor dropDown"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Standard" Value="Standard"></dx:ListEditItem>
                        <dx:ListEditItem Text="GroupBox" Value="GroupBox"></dx:ListEditItem>
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblShowHeader" runat="server" SkinID="Option" CssClass="label" Text="Show header:"
                    AssociatedControlID="cbShowHeader">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="cbShowHeader" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" Checked="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblRtl" SkinID="Option" CssClass="label" Text="Right to left:">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbRtl" SkinID="Option" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblEnabled" SkinID="Option" CssClass="label" Text="Disabled:"
                    AssociatedControlID="chbDisabled">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbDisabled" SkinID="Option" Checked="false" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table> 
</asp:Content>
