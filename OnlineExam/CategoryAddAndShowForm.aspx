<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryAddAndShowForm.aspx.cs" Inherits="OnlineExam.CategoryAddAndShowForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="Bootstrape/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
   <div style="position:relative;left: 20%;top: 200px">
       
        <% if (CategoryAddSuccessMsgDisplayLabel.Text != "")
       {%>
           <asp:Label runat="server" ID="CategoryAddSuccessMsgDisplayLabel" CssClass="alert alert-success"></asp:Label> 
       <%}%>
     <%else if (CatErrorMsgDisplayLabel.Text != "")
       {%>
          
    <asp:Label runat="server" ID="CatErrorMsgDisplayLabel" CssClass="alert alert-warning" Font-Bold="True" ></asp:Label>
       <%}%>
    <br/>  <br/>
    <form id="form1" runat="server">
 <asp:Label runat="server">Category</asp:Label>
        <asp:TextBox runat="server" ID="CategoryAddTextBox" Height="30px" Width="227px"/>
        <asp:RequiredFieldValidator runat="server" ErrorMessage="Fill up this field" ControlToValidate="CategoryAddTextBox" Font-Bold="True"  ForeColor="#FF8080" SetFocusOnError="True"></asp:RequiredFieldValidator>
       <br/>     <br/>
        <asp:Button runat="server" Text="Save" ID="CategoryAddBtn" style="margin-left: 66px" Width="111px" CssClass="btn-success" OnClick="CategoryAddBtn_Click"  /> <asp:HyperLink ID="HyperLink1" NavigateUrl="AdminIndex.aspx" runat="server">
                          GO back to Previous page
                  </asp:HyperLink></td>
    </form>
   </div>
</body>
</html>
