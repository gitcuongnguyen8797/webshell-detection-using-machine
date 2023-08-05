<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxCheckBox1.Enabled = !chbDisabled.Checked;
        ASPxCheckBox2.Enabled = !chbDisabled.Checked;
        ASPxCheckBox3.Enabled = !chbDisabled.Checked;

        ASPxCheckBox1.ValidationSettings.EnableCustomValidation = chbShowError.Checked;
        ASPxCheckBox1.IsValid = !chbShowError.Checked;
        
        lblShowError.Enabled = !chbDisabled.Checked;
        chbShowError.Enabled = !chbDisabled.Checked;
        
        ASPxCheckBox1.Native = chbNative.Checked;
        ASPxCheckBox2.Native = chbNative.Checked;
        ASPxCheckBox3.Native = chbNative.Checked;
        
        ASPxCheckBox1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        ASPxCheckBox2.RightToLeft = ASPxCheckBox1.RightToLeft;
        ASPxCheckBox3.RightToLeft = ASPxCheckBox1.RightToLeft;
        
        RtlContainer.RightToLeft = ASPxCheckBox1.RightToLeft;

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("Native", delegate(bool value) { chbNative.Checked = value; }, false);
        LoadOption<bool>("ShowError", delegate(bool value) { chbShowError.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("Native", delegate() { return chbNative.Checked; });
        SaveOption<bool>("ShowError", delegate() { return chbShowError.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/CheckBox.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Text="Checked" Checked="true"
        Width="50px" ClientInstanceName="cb1">
        <ClientSideEvents Init="function(s, e) { new ASPxCheckBoxPreviewHelper(s); }" />
        <ValidationSettings ErrorText="Sample error text">
        </ValidationSettings>
    </dx:ASPxCheckBox>
    <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" Text="Unchecked" Checked="false"
        Width="50px" ClientInstanceName="cb2">
        <ClientSideEvents Init="function(s, e) { new ASPxCheckBoxPreviewHelper(s); }" />
    </dx:ASPxCheckBox>
    <dx:ASPxCheckBox ID="ASPxCheckBox3" runat="server" Text="Grayed" Width="50px" AllowGrayed="true"
        ClientInstanceName="cb3">
        <ClientSideEvents Init="function(s, e) { new ASPxCheckBoxPreviewHelper(s); }" />
    </dx:ASPxCheckBox>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblNative" CssClass="label" SkinID="Option" Text="Native:"
                    AssociatedControlID="chbNative">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbNative" CssClass="editor" SkinID="Option"
                    AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowError" SkinID="Option" CssClass="label" Text="Show error frame:"
                    AssociatedControlID="chbShowError">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowError" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" ClientInstanceName="chbShowError">
                </dx:ASPxCheckBox>
            </td>
        </tr>
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
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblEnabled" SkinID="Option" CssClass="label" Text="Disabled:"
                    AssociatedControlID="chbDisabled">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbDisabled" SkinID="Option" Checked="false"
                    CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
