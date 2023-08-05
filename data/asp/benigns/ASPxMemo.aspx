<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxMemo1.Enabled = !chbDisabled.Checked;
        
        lblShowError.Enabled = !chbDisabled.Checked;
        chbShowError.Enabled = !chbDisabled.Checked;

        ASPxMemo1.ValidationSettings.EnableCustomValidation = chbShowError.Checked;
        ASPxMemo1.IsValid = !chbShowError.Checked;
        
        ASPxMemo1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxMemo1.RightToLeft;
        
        ASPxMemo1.Native = chbNative.Checked;
        
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

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxMemo ID="ASPxMemo1" runat="server" Text="Sample Text" Rows="10" Columns="40" ClientInstanceName="memo">
        <ClientSideEvents
            Init="function(s, e) { new ASPxEditorPreviewHelper(s); }"
            Validation="function() {}"/>
        <ValidationSettings ErrorText="Sample error text">
        </ValidationSettings>
    </dx:ASPxMemo>
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
                <dx:ASPxCheckBox runat="server" ID="chbNative"  CssClass="editor" SkinID="Option" AutoPostBack="true"></dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowError" SkinID="Option" CssClass="label" Text="Show error frame:"
                    AssociatedControlID="chbShowError">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowError" SkinID="Option" CssClass="editor" AutoPostBack="true"
                    ClientInstanceName="chbShowError">
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
                <dx:ASPxCheckBox runat="server" ID="chbDisabled" SkinID="Option" Checked="false" CssClass="editor" AutoPostBack="true">
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
