<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserResultForm.aspx.cs" Inherits="OnlineExam.UserResultForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link href="Bootstrape/bootstrap.min.css" rel="stylesheet" />
    <link href="Bootstrape/navbar-top.css" rel="stylesheet" />
    
        <style>th,td{text-align: center}</style>
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
    
    <form id="form1" runat="server" style=" margin-top: 22px">
         <asp:Label ID="ReultMsgLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Large" ForeColor="#408080" Font-Names="Arial"></asp:Label>
       <br/> <br/><table class="table table-bordered" id="resultTable">
            <tr>
                <th>
                    Subject
                </th>
                <th>
                    Total Qustion
                </th>
                <th>
                    Pass Mark
                </th>
                <th>Your score</th>
                <th>Your score in Percentage(%)</th>
                    <th>Remarks</th>
            </tr>
            <tr>
                <td>    <asp:Label ID="SubjectLabel" runat="server" Text="Label"></asp:Label></td>
                  <td>            <asp:Label ID="TotalQuestionLabel" runat="server" Text="Label"></asp:Label></td>
                  <td>
                       <asp:Label ID="PassMarkLabel" runat="server" Text="Label"></asp:Label>
                  </td>
                  <td>  <asp:Label ID="UserScoreLabel" runat="server" Text="Label"></asp:Label></td>
                  <td><asp:Label ID="PercentageShowLabel" runat="server" Text="Label"></asp:Label></td>
           
                  <td><asp:Label ID="RemarkLabel" runat="server" Text="Label"></asp:Label></td>
           
                
                
                 </tr>
        </table>

         <asp:Button ID="QuestionReviewButton" runat="server" CssClass="badge-primary" Height="41px" OnClick="QuestionReviewButton_Click" Text="Review Question" Width="163px" ForeColor="White" />

    </form>
</body>
</html>
