<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxLoadingPanel1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxLoadingPanel1.RightToLeft;
        
        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <div id="Div1" class="control" style="width:300px; height:200px"></div>
    <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" Modal="true">
        <ClientSideEvents Init="function(s, e) { s.ShowInElementByID('Div1'); } " />
    </dx:ASPxLoadingPanel>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblRtl" SkinID="Option" CssClass="label" Text="Right to left:"
                    AssociatedControlID="chbRtl">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbRtl" SkinID="Option" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>