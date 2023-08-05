<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
        ASPxTreeView1.Enabled = !chbDisabled.Checked;
        chbShowLoadingPanel.Enabled = !chbDisabled.Checked;
        lblShowLoadingPanel.Enabled = !chbDisabled.Checked;
        ASPxTreeView1.SelectedNode = ASPxTreeView1.Nodes[5];
        ASPxTreeView1.RightToLeft = chbRtl.Checked ? DefaultBoolean.True : DefaultBoolean.False;
        RtlContainer.RightToLeft = ASPxTreeView1.RightToLeft;
        
        ShowOptions();
    }
</script>

<asp:Content runat="server" ID="Content3" ContentPlaceHolderID="phHead">
    <script type="text/javascript" src="Scripts/PreviewHelpers/CheckBox.js"></script>
    <script type="text/javascript" src="Scripts/PreviewHelpers/TreeView.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dx:ASPxTreeView ID="ASPxTreeView1" runat="server" AllowCheckNodes="true"
        ClientInstanceName="treeView" EnableCallBacks="true" CheckNodesRecursive="true">
        <ClientSideEvents Init="function(s,e) { new ASPxTreeViewPreviewHelper(s); }"/>
        <Nodes>
             <dx:TreeViewNode Text="Node" Expanded="true">
                <Nodes>
                    <dx:TreeViewNode Text="SubNode" Checked="true">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="SubNode" Name="NodeForCheck">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="SubNode">
                    </dx:TreeViewNode>
                </Nodes>
            </dx:TreeViewNode>
            <dx:TreeViewNode Text="Node (with image)" Expanded="false" Checked="true" Image-Url="~/Images/sample-image14x14.gif">
                <Nodes>
                    <dx:TreeViewNode Text="SubNode" Checked="true" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="SubNode" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="SubNode" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:TreeViewNode>
                </Nodes>
            </dx:TreeViewNode>
            <dx:TreeViewNode Text="Node (with link)" Expanded="false" NavigateUrl="#" Checked="true">
                <Nodes>
                    <dx:TreeViewNode Text="SubNode" NavigateUrl="#">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="SubNode" NavigateUrl="#">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="SubNode" NavigateUrl="#">
                    </dx:TreeViewNode>
                </Nodes>
            </dx:TreeViewNode>
            <dx:TreeViewNode Text="Node (with link & image)" Expanded="true" NavigateUrl="#" Image-Url="~/Images/sample-image14x14.gif">
                <Nodes>
                    <dx:TreeViewNode Text="SubNode" NavigateUrl="#" Image-Url="~/Images/sample-image14x14.gif" Checked="true">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="SubNode" NavigateUrl="#" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:TreeViewNode>
                    <dx:TreeViewNode Text="SubNode" NavigateUrl="#" Image-Url="~/Images/sample-image14x14.gif">
                    </dx:TreeViewNode>
                </Nodes>
            </dx:TreeViewNode>
            <dx:TreeViewNode Text="Sample Node 2 (disabled)" Enabled="false" NavigateUrl="#">
            </dx:TreeViewNode>
            <dx:TreeViewNode Text="Sample Node 3 (selected)" NavigateUrl="#">
            </dx:TreeViewNode>
        </Nodes>
    </dx:ASPxTreeView>

    <script type="text/javascript">
        ASPxTBHelper.OnSelectionModeChanged = function(selectionMode) {
            if(!ASPxClientControl.GetControlCollection().GetByName('chbShowLoadingPanel'))
                return;

            if(!selectionMode)
                chbShowLoadingPanel.SetChecked(false);
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
                <dx:ASPxLabel runat="server" ID="lblShowLoadingPanel" CssClass="label" SkinID="Option" Text="Show loading panel:"
                    AssociatedControlID="chbShowLoadingPanel">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxCheckBox runat="server" ID="chbShowLoadingPanel" CssClass="editor" SkinID="Option" ClientInstanceName="chbShowLoadingPanel">
                    <ClientSideEvents CheckedChanged="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(treeView, s.GetChecked()); }"
                        Init="function(s,e){ ASPxTBHelper.SetControlLoadingPanelVisibility(treeView, s.GetChecked()); }" />
                </dx:ASPxCheckBox>
            </td>
        </tr>
    </table>
</asp:Content>
