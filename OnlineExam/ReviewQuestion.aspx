<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewQuestion.aspx.cs" Inherits="OnlineExam.ReviewQuestion" %>
<%@ Import Namespace="OnlineExam.Models" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link href="Bootstrape/bootstrap.min.css" rel="stylesheet" />
    <link href="Bootstrape/navbar-top.css" rel="stylesheet" />
    
    <link href="KendoUI/kendo.common.min.css" rel="stylesheet" />
    
    <link href="KendoUI/kendo.uniform.min.css" rel="stylesheet" />
    <script src="KendoUI/jquery.min.js"></script>
    <script src="KendoUI/kendo.all.min.js"></script>
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
    
    <form id="form1" runat="server">
 <div >
      
     
     
     <%   var _db = new OnlineExamDbConbtext();
          int sid = Convert.ToInt32(Request.QueryString["sid"]);

          var query = (from q in _db.Questions

                       where q.SubjectId == sid

                       select new
                       {
                           q.QuestionDescription,
                           q.QuestionId,
                           q.Ans1,
                           q.Ans2
                           ,
                           q.Ans3,
                           q.Ans4,
                           q.TrueAns
                       });
          %><br/><br/>
     <table class="table table-bordered;" >
         <tr>
             <th style="text-align: center">Questions</th>
         </tr>
   
     <%
         char ans=' ',userAnswer=' ';
         foreach (var item in query)
         {
             int userId = Convert.ToInt32(Session["authUserID"]);
             var userAns = _db.UserAnswers.Single(m => m.QuestionId == item.QuestionId && m.UserId == userId).UserAns;
     
            switch (item.TrueAns)
            {
                case 1:
                    ans = 'a';
                    break;
                case 2:
                    ans = 'b';
                    break;
                case 3:
                    ans = 'c';
                    break;
                case 4:
                    ans = 'd';
                    break;
            }



            switch (userAns)
            {
                case 1:
                    userAnswer = 'a';
                    break;
                case 2:
                    userAnswer = 'b';
                    break;
                case 3:
                    userAnswer = 'c';
                    break;
                case 4:
                    userAnswer = 'd';
                    break;
            }
         
            %>
           <tr>
               <td ><span style="color:green;font-size: 1.5em;font-weight: bold;font-family: Arial"><%: item.QuestionDescription %></span>
                   <br/>
                   
                   a. <%: item.Ans1 %><br/>

                   b. <%: item.Ans2 %><br/>
                   c. <%: item.Ans3%><br/>
                   d .<%: item.Ans4%><br/><br/>
                   
                   
                   <% if (item.TrueAns==userAns)
                      {  %>
                         
                  <span style="color: darkgray;font-weight: bold">Correct Answer:</span>  <span style="font-weight: bold;font-size: 1.5em;font-family: Arial;"><%:ans %></span> &nbsp;<span style="color: darkgray;font-weight: bold">Your Answer:</span> <span style="font-weight: bold;font-size: 1.5em;font-family: Arial;"><%:userAnswer %> </span>&nbsp;<img src="Icons/Ok.png" width="15"/>
                      <% } %>
                   <% else
                      {  %>
                         
                  <span style="color: darkgray;font-weight: bold">Correct Answer:</span>  <span style="font-weight: bold;font-size: 1.5em;font-family: Arial;"><%:ans %></span>&nbsp;<span style="color: darkgray;font-weight: bold">Your Answer:</span> <span style="font-weight: bold;font-size: 1.5em;font-family: Arial;"> <%:userAnswer %> </span>&nbsp;<img src="Icons/Close.png" width="15"/>
                      <% } %>
                
                   <br/>
               </td>
           </tr> 
     
       <% } %>
       </table>

     <% 
   Response.Write("<a href='UserResultForm.aspx?sid="+sid+"'> Go back to Previous page</a>"); 
  
      
       
%>
        
      
 </div>
   
        
    </form>
    
     <script>


         $("table").kendoGrid({


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

    </script>

</body>
</html>
