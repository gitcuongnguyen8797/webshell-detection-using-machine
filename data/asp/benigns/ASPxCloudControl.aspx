<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    public class DataObject {
        public string Text { get; set; }
        public int Value { get; set; }
        public string NavigateUrl { get; set; }
    }
    protected void Page_Load(object sender, EventArgs e) {
        ASPxCloudControl1.Enabled = !chbDisabled.Checked;
        ASPxCloudControl1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxCloudControl1.RightToLeft;
        
        ASPxCloudControl1.DataSource = CreateDataSource();
        ASPxCloudControl1.DataBind();

        ShowOptions();
    }
    protected DataObject[] CreateDataSource() {
        Random rnd = new Random();
        int recordCount = 50;
        DataObject[] data = new DataObject[recordCount];
        for(int i = 0; i < recordCount; i++) {
            data[i] = new DataObject { Text = "Text" + i.ToString(), Value = rnd.Next(100), NavigateUrl = "#" };
        }

        return data;
    }
    protected override void LoadOptions() {
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxCloudControl ID="ASPxCloudControl1" runat="server" TextField="Text" ShowValues="true" ValueField="Value"
        NavigateUrlField="NavigateUrl" Width="700px">
        <ClientSideEvents Init="function(s, e) { new ASPxControlPreviewHelper(s); }"/>
    </dx:ASPxCloudControl>
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

