<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxValidationSummary1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxValidationSummary1.RightToLeft;

        ASPxValidationSummary1.ShowErrorAsLink = chbShowErrorAsLink.Checked;
        ASPxValidationSummary1.RenderMode = (ValidationSummaryRenderMode)Enum.Parse(typeof(ValidationSummaryRenderMode), cbxRenderMode.SelectedItem.Value.ToString());


        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<ValidationSummaryRenderMode>("RenderMode", delegate(ValidationSummaryRenderMode value) { cbxRenderMode.Text = value.ToString(); }, ValidationSummaryRenderMode.Table);
        LoadOption<bool>("ShowErrorAsLink", delegate(bool value) { chbShowErrorAsLink.Checked = value; }, true);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<ValidationSummaryRenderMode>("RenderMode", delegate() { return (ValidationSummaryRenderMode)Enum.Parse(typeof(ValidationSummaryRenderMode), cbxRenderMode.Text); });
        SaveOption<bool>("ShowErrorAsLink", delegate() { return chbShowErrorAsLink.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/DropDownEdit.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Calendar.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <div style="display: none">
        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="200px">
            <ValidationSettings>
                <RequiredField IsRequired="True" ErrorText="Field1 is required" />
            </ValidationSettings>
        </dx:ASPxTextBox>
        <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="200px">
            <ValidationSettings>
                <RequiredField IsRequired="True" ErrorText="Field2 is required" />
            </ValidationSettings>
        </dx:ASPxTextBox>
    </div>
    <dx:ASPxValidationSummary ID="ASPxValidationSummary1" runat="server">
        <ClientSideEvents Init="function(s,e) { ASPxClientEdit.ValidateEditorsInContainer(null, null, true); } " />
    </dx:ASPxValidationSummary>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblRenderMode" runat="server" SkinID="Option" CssClass="label" Text="Render mode:" AssociatedControlID="cbxRenderMode" />
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxRenderMode" SelectedIndex="0" AutoPostBack="true" SkinID="Option" CssClass="editor">
                    <Items>
                        <dx:ListEditItem Text="Table" Value="Table" />
                        <dx:ListEditItem Text="BulletedList" Value="BulletedList" />
                        <dx:ListEditItem Text="OrderedList" Value="OrderedList" />
                    </Items>
                </dx:ASPxComboBox> 
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowErrorsLink" SkinID="Option" CssClass="label" Text="Show error as link:"
                    AssociatedControlID="chbShowErrorsLink">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowErrorAsLink" SkinID="Option" CssClass="editor" AutoPostBack="true" Checked="true">
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
    </table>
</asp:Content>