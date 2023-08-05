<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Inherits="ASPxThemeBuilderSite.BasePage" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e) {
    }
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="phComponent" runat="Server">
    <dxchartsui:WebChartControl runat="server" ID="chart" ClientInstanceName="chart">
        <diagramserializable>
            <dxcharts:XYDiagram>
                <axisx visibleinpanesserializable="-1">
                    <range sidemarginsenabled="True" />
                </axisx>
                <axisy visibleinpanesserializable="-1">
                    <range sidemarginsenabled="True" />
                </axisy>
            </dxcharts:XYDiagram>
        </diagramserializable>
<FillStyle><OptionsSerializable>
<dxcharts:SolidFillOptions></dxcharts:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

        <seriesserializable>
            <dxcharts:Series Name="Series">
                <points>
                    <dxcharts:SeriesPoint ArgumentSerializable="1" Values="2">
                    </dxcharts:SeriesPoint>
                    <dxcharts:SeriesPoint ArgumentSerializable="2" Values="4">
                    </dxcharts:SeriesPoint>
                    <dxcharts:SeriesPoint ArgumentSerializable="3" Values="1">
                    </dxcharts:SeriesPoint>
                </points>
                <viewserializable>
                    <dxcharts:SideBySideBarSeriesView>
                    </dxcharts:SideBySideBarSeriesView>
                </viewserializable>
                <labelserializable>
                    <dxcharts:SideBySideBarSeriesLabel LineVisible="True">
                        <fillstyle>
                            <optionsserializable>
                                <dxcharts:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                        <pointoptionsserializable>
                            <dxcharts:PointOptions>
                            </dxcharts:PointOptions>
                        </pointoptionsserializable>
                    </dxcharts:SideBySideBarSeriesLabel>
                </labelserializable>
                <legendpointoptionsserializable>
                    <dxcharts:PointOptions>
                    </dxcharts:PointOptions>
                </legendpointoptionsserializable>
            </dxcharts:Series>
        </seriesserializable>

<SeriesTemplate><ViewSerializable>
<dxcharts:SideBySideBarSeriesView></dxcharts:SideBySideBarSeriesView>
</ViewSerializable>
<LabelSerializable>
<dxcharts:SideBySideBarSeriesLabel LineVisible="True">
<FillStyle><OptionsSerializable>
<dxcharts:SolidFillOptions></dxcharts:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
<PointOptionsSerializable>
<dxcharts:PointOptions></dxcharts:PointOptions>
</PointOptionsSerializable>
</dxcharts:SideBySideBarSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<dxcharts:PointOptions></dxcharts:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>
    </dxchartsui:WebChartControl>
    <script type="text/javascript">
        new ASPxControlPreviewHelper(chart);

        ASPxTBHelper.OnSelectionModeChanged = function (selectionMode) {
            ASPxTBHelper.SetControlLoadingPanelVisibility(chart, selectionMode);
        };

    </script>
</asp:Content>
