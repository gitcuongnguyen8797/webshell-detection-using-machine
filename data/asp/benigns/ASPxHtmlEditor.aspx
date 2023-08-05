<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxHtmlEditor1.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;

        lblShowError.Enabled = !chbDisabled.Checked;
        chbShowError.Enabled = !chbDisabled.Checked;

        ASPxHtmlEditor1.Validation += new EventHandler<HtmlEditorValidationEventArgs>(OnValidate);
        ASPxHtmlEditor1.IsValid = !chbShowError.Checked;
        
        if(!IsPostBack) {
            ASPxHtmlEditor1.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar1());
            ASPxHtmlEditor1.Toolbars.Add(HtmlEditorToolbar.CreateStandardToolbar2());
            ASPxHtmlEditor1.Toolbars.Add(HtmlEditorToolbar.CreateTableToolbar());

            ToolbarCheckSpellingButton checkSpellButton = new ToolbarCheckSpellingButton();
            checkSpellButton.BeginGroup = true;
            ASPxHtmlEditor1.Toolbars[0].Items.Add(checkSpellButton);
            ((ASPxSpellCheckerISpellDictionary)ASPxHtmlEditor1.SettingsSpellChecker.Dictionaries[0]).Encoding = System.Text.Encoding.GetEncoding(1252);
        }

        ASPxHtmlEditor1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxHtmlEditor1.RightToLeft;

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("ShowError", delegate(bool value) { chbShowError.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("ShowError", delegate() { return chbShowError.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
    void OnValidate(object sender, HtmlEditorValidationEventArgs e) { 
    }
</script>

<asp:Content ID="Content3" ContentPlaceHolderID="phHead" runat="Server">
    <script type="text/javascript" src="Scripts/PreviewHelpers/CheckBox.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/SpellChecker.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/TabControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/Menu.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/HtmlEditor.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxHtmlEditor id="ASPxHtmlEditor1" runat="server" ClientInstanceName="he" 
        Html="Accordnig to an englnsih unviersitry sutdy the oredr of letetrs in a word dosen't mttaer, the olny thnig thta's imporantt is that the frsit and last ltteer of eevry word is in the crrecot psoition. The rset can be jmbueld and one is stlil able to read the txet withuot dificultfiy.">            
        <ClientSideEvents Init="function(s, e) { new ASPxHtmlEditroPreviewHelper(s); }"/>
        <SettingsResize AllowResize="true" />
        <settingsimageupload>
            <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png"></ValidationSettings>
        </settingsimageupload>
        <settingsspellchecker culture="English (United States)">
            <Dictionaries>
                <dx:ASPxSpellCheckerISpellDictionary AlphabetPath="~/Dictionaries/EnglishAlphabet.txt"
                    GrammarPath="~/Dictionaries/english.aff" DictionaryPath="~/Dictionaries/american.xlg"
                    CacheKey="ispellDic" Culture="English (United States)">
                </dx:ASPxSpellCheckerISpellDictionary>
            </Dictionaries>
        </settingsspellchecker>
        <settingsimageselector>
            <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png"></CommonSettings>
        </settingsimageselector>
        <settingsdocumentselector>
            <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp"></CommonSettings>
        </settingsdocumentselector>
    </dx:ASPxHtmlEditor>

    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function (selectionMode) {
            if(!ASPxClientControl.GetControlCollection().GetByName('chbShowLoadingPanel'))
                return;

            if (!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
        };
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="phOptions" runat="server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowError" SkinID="Option" CssClass="label" Text="Show error area:"
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
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option"
                    Text="Show loading panel:" AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option"
                    ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s, e) { ASPxTBHelper.SetControlLoadingPanelVisibility(he, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(he, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
