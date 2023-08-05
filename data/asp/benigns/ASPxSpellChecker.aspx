<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxSpellChecker1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxSpellChecker1.RightToLeft;
        
        if(!IsPostBack)
            ((ASPxSpellCheckerISpellDictionary)ASPxSpellChecker1.Dictionaries[0]).Encoding = System.Text.Encoding.GetEncoding(1252);

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>
<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/CheckBox.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/PopupControl.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/SpellChecker.js"></script>
    <script type="text/javascript">
        var firstLoad = true;

        function StoreTextAreaInitialContent(textArea) {
            TextArea.initialContent = TextArea.GetText();
        }
        function ResetTextAreaContentToInitial(textArea) {
            if(TextArea.initialContent)
                TextArea.SetText(TextArea.initialContent);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxSpellChecker runat="server" ID="ASPxSpellChecker1" ClientInstanceName="sc"
        CheckedElementID="TextArea">
        <ClientSideEvents
            Init="function(s, e) { new ASPxSpellCheckerPreviewHelper(s); }"
            BeginCallback = "function() { firstLoad = false; }"
        />
        <Dictionaries>
            <dx:ASPxSpellCheckerISpellDictionary AlphabetPath="~/Dictionaries/EnglishAlphabet.txt"
                GrammarPath="~/Dictionaries/english.aff" DictionaryPath="~/Dictionaries/american.xlg"
                CacheKey="ispellDic" Culture="English (United States)">
            </dx:ASPxSpellCheckerISpellDictionary>
        </Dictionaries>
    </dx:ASPxSpellChecker>
    <table>
        <tr>
            <td>
                <dx:ASPxButton runat="server" ID="btnCheckSpelling" AutoPostBack="false" Text="Check Spelling ..."
                    CssClass="unselectable" ClientInstanceName="checkSpellingBtn" >
                    <ClientSideEvents
                        Click="function(s, e) { sc.Check(); }" />
                </dx:ASPxButton>
            </td>
        </tr>
    </table>

    <dx:ASPxMemo runat="server" ID="TextArea" ClientInstanceName="TextArea" Height="100px" Width="550px" 
        Text="Accordnig to an englnsih unviersitry sutdy the oredr of letetrs in a word dosen't mttaer, the olny thnig thta's imporantt is that the frsit and last ltteer of eevry word is in the crrecot psoition. The rset can be jmbueld and one is stlil able to read the txet withuot dificultfiy.">
        <ClientSideEvents Init="function(s, e) { StoreTextAreaInitialContent(s); }"/>
    </dx:ASPxMemo>
    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function(selectionMode) {
            if (!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
        };
        ASPxTBHelper.OnPreviewHelpersReady = function() {
            if(firstLoad)
                sc.Check();
        };
    </script>
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
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option" Text="Show loading panel:"
                    AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" SkinID="Option" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents
                        CheckedChanged="function(s,e){ 
                            ASPxTBHelper.GetControlPreviewHelper(sc.name).SetOffsetElement(TextArea.GetMainElement());
                            ASPxTBHelper.SetControlLoadingPanelVisibility(sc, s.GetChecked());
                        }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(sc, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>