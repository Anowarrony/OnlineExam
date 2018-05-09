<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLoginForm.aspx.cs" Inherits="OnlineExam.UserLoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
        <link href="Bootstrape/bootstrap.min.css" rel="stylesheet" />
    <link href="Bootstrape/navbar-top.css" rel="stylesheet" />
    <link href="Content/style.css" rel="stylesheet" />
</head>
<body>
    
    
    
   <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse mb-4">
      <button class="navbar-toggler navbar-toggler-left" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

    
        <% if (Session["authUserID"]==null)
           { %>
        
          <a class="navbar-brand" href="UserLoginForm.aspx">Login</a>
        <% } %>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="HomeForm.aspx">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
               <% if (Session["authUserID"]==null)
           { %>
        
    <a class="nav-link" href="UserSignUpForm.aspx">Sign Up</a>
        <% } %>
          
          </li>
          <li class="nav-item active">
                  <% if (Session["authUserID"]!=null)
           { %>
        
    <a class="nav-link " href="UserAccountForm.aspx">My Account</a>
              
        <% } %>
         

          </li>
              <li class="nav-item active">
                  <% if (Session["authUserID"]!=null)
           { %>
        
    <a class="nav-link " href="UserSignoutForm.aspx">Sign Out</a>
              
        <% } %>
         

          </li>

        </ul>

      </div>
    </nav>
    
    <div class="login-card" style="width: 40%">

    <form id="form1" runat="server" >
        <table style="border-collapse:separate;border-spacing:6px">
            <tr>
                <td colspan="3" style="text-align: center"> <asp:Label ID="MessageLabel" runat="server" Text="Label" Font-Bold="True" ForeColor="#FF8080"></asp:Label>
      </td>
            </tr>
            <tr>
                <td>     User Name</td>
                <td>        <asp:TextBox ID="userNameTextBox" CssClass="form-control" runat="server" ></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="userNameTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>  <tr>
                <td>Password</td>
                <td>            <asp:TextBox ID="passwordTextBox" CssClass="form-control" runat="server"  TextMode="Password" ></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" ControlToValidate="passwordTextBox" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
              <tr>
                <td></td>
                <td style="text-align: left">  <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  Text="Login"  CssClass=" btn-info btn-lg" />
        </td>
                <td>
                   
                    
                     </td>
            </tr>
        </table>


      
      
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           
              </p>
    </form>
        </div>
</body>
</html>
