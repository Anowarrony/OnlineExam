<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSignUpForm.aspx.cs" Inherits="OnlineExam.UserSignUpForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 133px;
        }
    </style>
    
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
    
  
       <div class="login-card" style="width: 60%">

    <form id="form1" runat="server" >
  
      <h2>     <img src="Content/connected_multiple_big.jpg" width="131" height="155" />
                                             
     New User Signup</h2>
  

       <table  style="width: 100%;border-collapse:separate;border-spacing:6px">
         <tr>
           <td class="auto-style1"><div align="left" class="style7">Username </div></td>
           <td>
               <asp:TextBox ID="UserNameTextBox" CssClass="form-control" runat="server" ></asp:TextBox>
               <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label>
             </td>
         </tr>
         <tr>
           <td class="auto-style1">Password</td>
           <td>
               <asp:TextBox ID="PasswordTextBox" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
               <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Label"></asp:Label>
             </td>
         </tr>
         <tr>
           <td class="auto-style1">Confirm Password </td>
           <td>
               <asp:TextBox ID="ConfirmPasswordTextBox" CssClass="form-control" TextMode="Password" runat="server" ></asp:TextBox>
               <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="Label"></asp:Label>
             </td>
         </tr>
         <tr>
           <td class="auto-style1">Email</td>
           <td>
               <asp:TextBox ID="EmailTextBox" runat="server" CssClass="form-control"></asp:TextBox>
               <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Label"></asp:Label>
             </td>
         </tr>
         <tr>
           <td  class="auto-style1">Address</td>
           <td>
               <asp:TextBox ID="AddressTextBox" runat="server" CssClass="form-control" Height="54px" ></asp:TextBox>
               <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="Label"></asp:Label>
             </td>
         </tr>
         <tr>
           <td class="auto-style1">Country</td>
           <td>
               <asp:DropDownList ID="CountryDropDownList" CssClass="form-control" runat="server">
                   <asp:ListItem>Bangladesh</asp:ListItem>
                   <asp:ListItem>India</asp:ListItem>
                   <asp:ListItem>Nepal</asp:ListItem>
                   <asp:ListItem>Australia</asp:ListItem>
                   <asp:ListItem>Srilanka</asp:ListItem>
               </asp:DropDownList>
               <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="Label"></asp:Label>
             </td>
         </tr>
         <tr>
           <td  class="auto-style1">Phone</td>
           <td>
               <asp:TextBox ID="PhoneTextBox" runat="server" CssClass="form-control" ></asp:TextBox>
               <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="Label"></asp:Label>
             </td>
         </tr>
     
         <tr>
           <td class="auto-style1">&nbsp;</td>
           <td>&nbsp;<asp:Button ID="BtnUserSignup" runat="server" Font-Bold="True" Font-Italic="True"  OnClick="BtnUserSignup_Click" Text="Signup" Width="166px" CssClass="btn btn-success btn-lg" />
           </td>
         </tr>
       </table>
  

    </form></div>
</body>
</html>
