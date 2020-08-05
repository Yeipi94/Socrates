<%@ Page Title="" Language="C#" MasterPageFile="~/SolarisMaster.master" AutoEventWireup="true" CodeFile="Metas_graficas.aspx.cs" Inherits="Metas_graficas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
            <div class="col-md-6 col-lg-8">
                <div class="card">
                    <div class="card-body">
                            <h4 class="card-title mb-0">Avances</h4>
                            <div id="morris-bar-chart">
                                <asp:Chart ID="DX_Totales" runat="server" DataSourceID="SqlDataSource1"  Width="600px" >
                                    
                                    <Series>
                                        <asp:Series Name="Avance" YValuesPerPoint="6" XValueMember="Meta" YValueMembers="Avance" IsValueShownAsLabel="true" LabelAngle="-90" LabelFormat="0,0" ChartType="StackedColumn">
                                            <SmartLabelStyle Enabled="False" />
                                        </asp:Series>
                                        <asp:Series Name="Faltante" YValuesPerPoint="6" XValueMember="Meta" YValueMembers="Faltante" IsValueShownAsLabel="true" LabelAngle="-90" LabelFormat="0,0" ChartType="StackedColumn">
                                            <SmartLabelStyle Enabled="False" />
                                        </asp:Series>
                                    </Series>
                                    <Legends>
                                        <asp:Legend Name="seccion" IsTextAutoFit="true" Title="Secciones" HeaderSeparator="None" ItemColumnSeparator="None"  ItemColumnSpacing="50" Alignment="Center" Docking="Left">
                                        </asp:Legend>
                                    </Legends>
                                    <ChartAreas>
                                        <asp:ChartArea Name="seccion" AlignmentOrientation="Vertical" BackColor="White">
                                            <AxisY Maximum="15">
                                                <MajorGrid Enabled="False" />
                                                <LabelStyle Format="0,0" />
                                            </AxisY>
                                            <AxisX>
                                                <MajorGrid Enabled="False" />
                                            </AxisX>
<%--                                            <InnerPlotPosition Height="90" Width="90" X="7" />--%>
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SISTEM_ALIADOSConnectionString %>" SelectCommand="SELECT [seccion], [Meta], [Avance], [Faltante], AvancePorciento, FaltantePorciento FROM [Meta_Territorio]"></asp:SqlDataSource>
                            </div>
                    </div>
                </div>
        </div>
           <%-- <div class="col-md-6 col-lg-4">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">Recent Activity</h4>
                        <div class="mt-4 activity">
                            <div class="d-flex align-items-start border-left-line pb-3">
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
        </div>
</asp:Content>

