<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        trackBar1.Enabled = !chbDisabled.Checked;

        lblShowError.Enabled = !chbDisabled.Checked;
        chbShowError.Enabled = !chbDisabled.Checked;

        trackBar1.ValidationSettings.EnableCustomValidation = chbShowError.Checked;
        trackBar1.IsValid = !chbShowError.Checked;

        trackBar1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        trackBar2.RightToLeft = trackBar1.RightToLeft;
        RtlContainer.RightToLeft = trackBar1.RightToLeft;
        trackBar1.Orientation = (Orientation)Enum.Parse(typeof(Orientation), cbxOrientation.Value.ToString());
        trackBar1.Direction = (Direction)Enum.Parse(typeof(Direction), cbxDirection.Value.ToString());
        trackBar1.ScalePosition = (ScalePosition)Enum.Parse(typeof(ScalePosition), cbxScalePosition.Value.ToString());
        trackBar2.Orientation = trackBar1.Orientation;
        trackBar2.Direction = trackBar1.Direction;
        trackBar2.ScalePosition = trackBar1.ScalePosition;

        ShowOptions();
    }
    protected override void LoadOptions() {
        LoadOption<Orientation>("Orientation", delegate(Orientation value) { cbxOrientation.Value = Enum.GetName(typeof(Orientation), value); }, Orientation.Horizontal);
        LoadOption<Direction>("Direction", delegate(Direction value) { cbxDirection.Value = Enum.GetName(typeof(Direction), value); }, Direction.Normal);
        LoadOption<ScalePosition>("ScalePosition", delegate(ScalePosition value) { cbxScalePosition.Value = Enum.GetName(typeof(ScalePosition), value); }, ScalePosition.None);
        LoadOption<bool>("ShowError", delegate(bool value) { chbShowError.Checked = value; }, false);
        LoadOption<bool>("Disabled", delegate(bool value) { chbDisabled.Checked = value; }, false);
        LoadOption<bool>("Rtl", delegate(bool value) { chbRtl.Checked = value; }, false);
    }
    protected override void SaveOptions() {
        SaveOption<Orientation>("Orientation", delegate() { return (Orientation)Enum.Parse(typeof(Orientation), cbxOrientation.Value.ToString()); });
        SaveOption<Direction>("Direction", delegate() { return (Direction)Enum.Parse(typeof(Direction), cbxDirection.Value.ToString()); });
        SaveOption<ScalePosition>("ScalePosition", delegate() { return (ScalePosition)Enum.Parse(typeof(ScalePosition), cbxScalePosition.Value.ToString()); });
        SaveOption<bool>("ShowError", delegate() { return chbShowError.Checked; });
        SaveOption<bool>("Disabled", delegate() { return chbDisabled.Checked; });
        SaveOption<bool>("Rtl", delegate() { return chbRtl.Checked; });
    }
</script>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/TrackBar.js"></script>
    <script type="text/javascript">
        function SetDragHandlerToolTipVisibility(trackBar, visible) {
            ASPxTrackBarToolTipHelper.setToolTipElementStyle(trackBar);
            ASPxTrackBarToolTipHelper.UpdateToolTip(trackBar);
            if (visible)
                ASPxTrackBarToolTipHelper.ShowToolTip(trackBar, false);
            else
                ASPxTrackBarToolTipHelper.HideToolTip(trackBar);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxTrackBar runat="server" ID="trackBar1" ShowDragHandles="true" ScalePosition="Both"
        MinValue="0" MaxValue="50" ScaleLabelHighlightMode="AlongBarHighlight" ValueToolTipPosition="RightOrBottom"
        ClientInstanceName="trackBar1" EnableAnimation="false" AllowRangeSelection="true"
        PositionStart="10" PositionEnd="40" EnableViewState="false" Width="250px">
        <ClientSideEvents Init="function(s, e) { new ASPxTrackBarPreviewHelper(s); }" ValueChanged="function(s, e) { chbShowDragTooltip.SetChecked(false); }" />
        <ValidationSettings ErrorText="Sample error text">
        </ValidationSettings>
    </dx:ASPxTrackBar>
    <br />
    <dx:ASPxTrackBar runat="server" ID="trackBar2" ShowDragHandles="true" ScalePosition="Both"
        MinValue="0" MaxValue="50" ScaleLabelHighlightMode="AlongBarHighlight" ValueToolTipPosition="RightOrBottom"
        ClientInstanceName="trackBar2" Position="3" EnableAnimation="false" EnableViewState="false"  Width="250px">
        <ClientSideEvents Init="function(s, e) { new ASPxTrackBarPreviewHelper(s); }" />
        <ValidationSettings ErrorText="Sample error text">
        </ValidationSettings>
        <Items>
            <dx:TrackBarItem Text="Item 1" Value="1" />
            <dx:TrackBarItem Text="Item 2" Value="2" />
            <dx:TrackBarItem Text="Item 3" Value="3" />
            <dx:TrackBarItem Text="Item 4" Value="4" />
            <dx:TrackBarItem Text="Item 5" Value="5" />
        </Items>
    </dx:ASPxTrackBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="phOptions" runat="Server">
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblOrientation" runat="server" SkinID="Option" CssClass="label"
                    Text="Orientation:" AssociatedControlID="cbxOrientation">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxOrientation" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Horizontal" Value="Horizontal" />
                        <dx:ListEditItem Text="Vertical" Value="Vertical" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblDirection" runat="server" SkinID="Option" CssClass="label" Text="Direction:"
                    AssociatedControlID="cbxDirection">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxDirection" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Normal" Value="Normal" />
                        <dx:ListEditItem Text="Reversed" Value="Reversed" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblScalePosition" runat="server" SkinID="Option" CssClass="label" Text="Scale position:"
                    AssociatedControlID="cbxScalePosition">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox runat="server" ID="cbxScalePosition" SkinID="Option" CssClass="editor"
                    AutoPostBack="true" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="Both" Value="Both" />
                        <dx:ListEditItem Text="LeftOrTop" Value="LeftOrTop" />
                        <dx:ListEditItem Text="None" Value="None" />
                        <dx:ListEditItem Text="RightOrBottom" Value="RightOrBottom" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel runat="server" ID="lblShowDragToolTip" SkinID="Option" CssClass="label"
                    Text="Show drag handle tooltip:" AssociatedControlID="chbShowDragTooltip">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowDragTooltip" SkinID="Option" CssClass="editor"
                    Checked="false" AutoPostBack="false" ClientInstanceName="chbShowDragTooltip">
                    <ClientSideEvents ValueChanged="function(s, e) { SetDragHandlerToolTipVisibility(trackBar1, s.GetChecked()); }" />
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
