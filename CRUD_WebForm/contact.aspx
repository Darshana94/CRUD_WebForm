<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="CRUD_WebForm.contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
    <h1>Users Form</h1><br/>
    <form id="form1" runat="server">
        <asp:Label ID="msgSuccess" runat="server" Text="" ForeColor="Green"></asp:Label><br/>
        <asp:Label ID="msgFail" runat="server" Text="" ForeColor="Red"></asp:Label><br/>    
    <div class="row">
        <div class="col-md-6">

            <asp:HiddenField ID="contactId" runat="server" />
        <table class="table">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Address"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server"  Text="Date of Birth"></asp:Label>
                </td>
                <td colspan="2">
                    <asp:TextBox ID="txtdob" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    
                    &nbsp;</td>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-light" OnClick="btnClear_Click" />
                </td>
            </tr>
            <%--<tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Label ID="msgSuccess" runat="server" Text="" ForeColor="Green"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    
                </td>
                <td colspan="2">
                    <asp:Label ID="msgFail" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td>
            </tr>--%>
        </table>

        </div>
        <div class="col-md-6">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" CssClass="table table-responsive table-hover">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="Name" />
                <asp:BoundField DataField="address" HeaderText="Address" />
                <asp:BoundField DataField="dob" HeaderText="Date of Birth" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="linkView" runat="server" CommandArgument='<%# Eval("uid") %>' OnClick="linkview">View</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            </asp:GridView>
        </div>
        
    </div>
    </form>
</body>
</html>
