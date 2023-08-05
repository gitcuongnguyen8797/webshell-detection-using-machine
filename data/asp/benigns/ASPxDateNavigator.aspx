<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        dateNavigator.Enabled = !chbDisabled.Checked;

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="phHead" Runat="Server">
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Calendar.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/DateNavigator.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" Runat="Server">
    <dx:ASPxDateNavigator runat="server" ID="dateNavigator" MasterControlID="scheduler">
    </dx:ASPxDateNavigator> 
    <dx:ASPxScheduler runat="server" ID="scheduler" Visible="false">
    </dx:ASPxScheduler>
    <script type="text/javascript">
        new ASPxDateNavigatorPreviewHelper(ASPxTBHelper.FindControlByName("dateNavigator"));
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOptions" Runat="Server">
    <table>
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

