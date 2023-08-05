<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxDateEdit1.Enabled = !chbDisabled.Checked;

        lblShowTimeSection.Enabled = !chbDisabled.Checked;
        chbShowTimeSection.Enabled = !chbDisabled.Checked;
        
        lblShowError.Enabled = !chbDisabled.Checked;
        chbShowError.Enabled = !chbDisabled.Checked;

        ASPxDateEdit1.TimeSectionProperties.Visible = chbShowTimeSection.Checked;
        
        ASPxDateEdit1.ValidationSettings.EnableCustomValidation = chbShowError.Checked;
        ASPxDateEdit1.IsValid = !chbShowError.Checked;
        
        ASPxDateEdit1.Date = DateTime.Now.AddDays(1);
        ASPxDateEdit1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxDateEdit1.RightToLeft;

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("ShowTimeSection", delegate(bool value) { chbShowTimeSection.Checked = value; }, false);
        LoadOption<bool>("ShowError", delegate(bool value) { chbShowError.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("ShowTimeSection", delegate() { return chbShowTimeSection.Checked; });
        SaveOption<bool>("ShowError", delegate() { return chbShowError.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/DropDownEdit.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Calendar.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/DateEdit.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <div style="width: 560px">
        <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" ClientInstanceName="de" EnableAnimation="false">
            <ClientSideEvents Init="function(s, e) { new ASPxDateEditPreviewHelper(s); }" />
            <ValidationSettings ErrorText="Sample error text">
            </ValidationSettings>
            <CalendarProperties ShowClearButton="true" ShowDayHeaders="true" ShowHeader="true" ShowTodayButton="true" ShowWeekNumbers="true">
            </CalendarProperties>
        </dx:ASPxDateEdit>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowTimeSection" SkinID="Option" CssClass="label" Text="Show Time Section:"
                    AssociatedControlID="chbShowTimeSection">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowTimeSection" SkinID="Option" CssClass="editor" AutoPostBack="true" />
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