<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAccount.aspx.cs" Inherits="OnlineExam.AdminAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="Content/style.css" rel="stylesheet" />
    <title></title>
</head>
<body> <div class="login-card" style="width: 40%">
    <h3>    <asp:Label ID="MessageLabel" runat="server" Text="Label" Font-Bold="True" ForeColor="#FF8080"></asp:Label></h3>
    <form id="form1" runat="server" >
         
              <table style="border-collapse: separate;border-spacing: 6px;">
                  <tr>
                      <td>           User Name</td>
                      <td>          <asp:TextBox CssClass="form-control"  ID="userNameTextBox" runat="server"  ></asp:TextBox></td>
                      <td> <asp:Label ID="usernameLabel" runat="server" Font-Bold="True" ForeColor="#FF8080" Text="Label"></asp:Label></td>
                  </tr>
                   <tr>
                      <td>Password</td>
                      <td>     <asp:TextBox CssClass="form-control" ID="passwordTextBox" runat="server"  TextMode="Password" ></asp:TextBox></td>
                      <td> <asp:Label ID="passLabel" runat="server" Font-Bold="True" ForeColor="#FF8080" Text="Label"></asp:Label>
       </td>
                  </tr>
                  <tr>
                      <td></td>
                      <td colspan="2">
                           <asp:Button ID="Button1" CssClass="login login-submit" runat="server" OnClick="Button1_Click"  Text="Login"  />
                      </td>
                     
                  </tr>
              </table>
       

       
          
           
    
      
       
           
       
     
    </form>
    </div>
</body>
</html>
