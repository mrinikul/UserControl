<%@ Control Language="C#" AutoEventWireup="true" Inherits="Enroll_TransactionField" Codebehind="TransactionField.ascx.cs" %>

<asp:SqlDataSource ID="SqlDataSourceTransactionsByUniqueKeyNumberFieldName" 
    SelectCommandType="StoredProcedure" 
    ConnectionString="<%$ ConnectionStrings:WorkforceConnectionString %>" 
    OnSelected="SqlDataSourceTransactionsByUniqueKeyNumberFieldName_Selected"
    runat="server">
    <SelectParameters>
        <asp:Parameter Name="Parameter1" />
        <asp:Parameter Name="Parameter2" />
        <asp:Parameter Name="Parameter3" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:PlaceHolder ID="PlaceHolderFieldName" runat="server">
    <div class="">
        <h1 class="ui-corner-all ui-widget ui-toolbar ui-widget-header">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelFieldTitle" runat="server" Text='LabelFieldTitle'></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="LabelFieldValue" runat="server" Text="LabelFieldValue"></asp:Label>
        </h1>
    </div>
</asp:PlaceHolder>

<asp:PlaceHolder ID="PlaceHolderAccordionFieldName" runat="server">
    <div class="accordion">
        <h1>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="AccordionLabelFieldTitle" runat="server" Text='FieldTitleIRINA'></asp:Label>
            &nbsp;&nbsp;
            <asp:Label ID="AccordionLabelFieldValue" runat="server" Text="AccordionLabelFieldValue"></asp:Label>
        </h1>
        <asp:Repeater ID="RepeaterFieldName" 
            DataSourceID="SqlDataSourceTransactionsByUniqueKeyNumberFieldName" 
            runat="server">
            <HeaderTemplate>
                <div class="FieldName">
                <table border="1">
                      <tr>
                        <td>Old value</td>
                        <td>New value</td>
                        <td>Change date</td>
                        <td>Change time</td>
                        <td>User ID</td>
                    </tr>    
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("OldValue")%></td>
                    <td><%# Eval("NewValue")%></td>
                    <td><%# Eval("ChangeDate")%></td>
                    <td><%# Eval("ChangeTime")%></td>
                    <td>
                        <%# Eval("UserID")%>
                        <div style="display:none">
                            <%# Eval("RecKey")%>
                        </div>
                    </td>
                </tr>
            </ItemTemplate>
        <FooterTemplate>
            </table>
            </div>
        </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:PlaceHolder>
