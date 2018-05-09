<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAccountForm.aspx.cs" Inherits="OnlineExam.UserAccountForm" %>
<%@ Import Namespace="OnlineExam.Models" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Bootstrape/bootstrap.css" rel="stylesheet" />
        <link href="KendoUI/kendo.common.min.css" rel="stylesheet" />
    
    <link href="KendoUI/kendo.uniform.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.js"></script>
    <script src="KendoUI/kendo.all.min.js"></script>
    <script src="Bootstrape/bootstrap.js"></script>
    <script src="Bootstrape/bootstrap-tab.js"></script>

</head>
<body>
    
 
    
                  
 <nav class="navbar navbar-default" style="background: black;color: white;font-family: Arial">
  <div class="container-fluid">

    <ul class="nav navbar-nav navbar-default">
      <li ><a href="HomeForm.aspx">Home</a></li>
    
      <li>
          <% if (Session["authUserID"]!=null)
           { %>
        
    <a   href="UserAccountForm.aspx">My Account</a>
              
        <% } %>
      </li>
            <li>
          <% if (Session["authUserID"]!=null)
           { %>
        
    <a   href="HomeForm.aspx">Take a Test</a>
              
        <% } %>
      </li>
      <li>
                <% if (Session["authUserID"]!=null)
           { %>
        
    <a href="UserSignoutForm.aspx">Sign Out</a>
              
        <% } %>
      </li>
             <li>
                <% if (Session["authUserID"]==null)
           { %>
        
    <a   href="UserSignUpForm.aspx">Sign Up</a>
        <% } %>
      </li>
             <li>
              <% if (Session["authUserID"]==null)
           { %>
        
          <a  href="UserLoginForm.aspx">Login</a>
        <% } %>
      </li>
    </ul>
  </div>
</nav>

    
     <div class="bs-docs-example" style="position: relative">
        <ul id="myTab" class="nav nav-tabs">

            <li class="active">
                <a href="#AccountInfo" data-toggle="tab">

                    <i class="icon-book"></i>
                    Account Info
                </a>
                

            </li>
            <li>
                 <a href="#Tests" data-toggle="tab">

                    <i class="icon-book"></i>
                    Taken Test(s)
                     
                     
                </a> 
            </li>
           
            

        </ul>

        <div id="myTabContent" class="tab-content">


           <div class="tab-pane fade in active" id="AccountInfo">
               
               <% var db = new OnlineExamDbConbtext();
                  int authUserId = Convert.ToInt32(Session["authUserID"]);
                  var accountInfoData = db.Users.Where(m => m.UserId.Equals(authUserId)).Select(c => new { c.Username, c.Email, c.Phone, c.Country, c.Address });
                 
               %>
               <table class="table table-bordered">
                   <tr>
                       <th colspan="2" style="text-align: center;background: green;color: white">Your Profile information</th>
                   </tr>
             
               <% foreach (var item in accountInfoData) {
                       %> 
                     <tr>
                         <td style="text-align: center;color: darkgrey;font-weight: bold">
                             Username
                         </td>
                         <td style="font-size: 1.5em;font-weight: bold;font-family: Courier New"><%:item.Username %></td>
                     </tr>
                  <tr>
                         <td style="text-align: center;color: darkgrey;font-weight: bold">
                             Email
                         </td>
                         <td style="font-size: 1.5em;font-weight: bold;font-family: Courier New"><%:item.Email %></td>
                     </tr>
                     <tr>
                         <td style="text-align: center;color: darkgrey;font-weight: bold">
                             Mobile
                         </td>
                         <td style="font-size: 1.5em;font-weight: bold;font-family: Courier New"><%:item.Phone %></td>
                     </tr>
                     <tr>
                         <td style="text-align: center;color: darkgrey;font-weight: bold">
                             Address
                         </td>
                         <td style="font-size: 1.5em;font-weight: bold;font-family: Courier New"><%:item.Address %></td>
                     </tr>
                     <tr>
                         <td style="text-align: center;color: darkgrey;font-weight: bold">
                             Country
                         </td>
                         <td style="font-size: 1.5em;font-weight: bold;font-family: Courier New"><%:item.Country %></td>
                     </tr>
                  <%} %>
                </table> </div>  
            
             <div class="tab-pane fade in " id="Tests">
                 
                 <%
                     var data = (from u in db.UserAnswers
                         join s in db.Subjects on u.SubjectId equals s.SubjectId
                                 where u.UserId.Equals(authUserId)
                         select new {s.SubjectName,s.SubjectId}).Distinct();

                        
                 %>
                 <table class="table table-bordered" id="QuestionGridprofileInfoGrid">
                     <tr>
                         <th style="text-align: center"> Subject</th>
                     </tr>
                 <% foreach (var subject in data)
                    {%>
                        <tr>
                            <td style="text-align: center">
                               <%Response.Write("<a  href='UserQuizForm.aspx?sid=" + subject.SubjectId + "' >"); %> 
              <%:subject.SubjectName %>
                                <% Response.Write("</a>"); %>
                            </td>
                        </tr>
                 

                  <% } %>
                 </table>
 </div> </div>
    </div>

    <form id="form1" runat="server">
       
    </form>
    
     <script>


         $("#QuestionGridprofileInfoGrid").kendoGrid({


             pageable: {
                 refresh: true,
                 pageSizes: true,
                 buttonCount: 5
             }

              , dataSource: { pageSize: 3 }
              ,

             scrollable: false
              ,
             sortable: true,
             filterable: true,
             columnMenu: false,
             serverPaging: true
             ,
             type: "json"
         });
         $("#QuestionGridprofileInfoGrid td").css("text-align", "center");
    </script>
</body>
</html>
