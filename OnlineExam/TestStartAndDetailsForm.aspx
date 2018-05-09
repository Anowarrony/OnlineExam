<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestStartAndDetailsForm.aspx.cs" Inherits="OnlineExam.TestStartAndDetailsForm" %>
<%@ Import Namespace="OnlineExam.Models" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link href="Bootstrape/bootstrap.min.css" rel="stylesheet" />
    <link href="Bootstrape/navbar-top.css" rel="stylesheet" />

    <link href="KendoUI/kendo.common.min.css" rel="stylesheet" />
 
    <link href="KendoUI/kendo.uniform.min.css" rel="stylesheet" />
    <script src="jQueryUI/jquery-1.7.1.js"></script>

    <script src="KendoUI/kendo.all.min.js"></script>
    <style>td,th{text-align: center}</style>
    
</head>
<body>
    
    
    <form id="form1" runat="server">
    
    
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
    
    


 <br/><br/><div>
                  <%   int authUserId = Convert.ToInt32(Session["authUserID"]);
                      int cid = Convert.ToInt32(Request.QueryString["cid"]);
                      int sid = Convert.ToInt32(Request.QueryString["sid"]);
                      string catName = (Request.QueryString["catName"]).ToString();
                         var db = new OnlineExamDbConbtext();

                         
                         var subjectsFetchQuery = (from s in db.Subjects
                             join q in db.Questions on s.SubjectId equals q.SubjectId
                             where s.CategoryId.Equals(cid)
                                                   where s.SubjectId.Equals(sid)
                             select (new {s.SubjectName, s.SubjectId})).Distinct();
                              int countAnseredQuestionForCurrentUser = (from u in db.UserAnswers
                                                           join q in db.Questions on u.QuestionId equals q.QuestionId
                                                           where u.SubjectId.Equals(sid)
                                                           where u.UserId.Equals(authUserId)
                                                           select u.QuestionId).Count();
                              var tpq = db.Subjects.Single(s => s.SubjectId.Equals(sid)).TimePerQuestionInSecond;                           
                             %>
 
                         <%
                             
                                foreach (var item in subjectsFetchQuery)
                           {
                              
                               
                             float passMark;
                             double markPQues;
                             var totalQuestion = db.Questions.Count(c => c.SubjectId.Equals(item.SubjectId));
                             if (countAnseredQuestionForCurrentUser < totalQuestion)
                          
                            {
                               var getMpQ = db.Subjects.SingleOrDefault(c => c.SubjectId.Equals(item.SubjectId)).MarkPerQuestion;
                                 markPQues = getMpQ != null ? getMpQ.Value : 1;
                                 var getPassMark = db.Subjects.SingleOrDefault(c => c.SubjectId.Equals(item.SubjectId)).PassMark;
                                 passMark = (float)(getPassMark != null ? getPassMark.Value * markPQues * totalQuestion / 100 : (float)33 * totalQuestion * markPQues / 100);
                        
                                 %>
                             
                       
                       <div style="position: relative;left: 10%">
                               <span>Test Name :<span style="color: green;font-weight: bold;font-family: Arial"> Online</span>  </span> <span style="color: green;font-weight: bold;font-family: Arial"><%:item.SubjectName %> &nbsp;<%:catName %>  </span>
                    

                        <hr/>
     <span style="font-family: Arial;font-weight: bold;font-style: italic;text-decoration: underline;color: green;">Instructions</span>
                                 <ul style="list-style: circle">
                                     
                                     <li>Total number of questions: <span style="font-weight: bold;"><%:totalQuestion %></span></li>
                                     <li>Minimum marks required to pass: <span style="font-weight: bold"><%:passMark %></span></li>
                                 <li>Each question carry <span style="font-weight: bold"><%:markPQues %></span> mark,no negative marks. </li>
                                    <li>You will get only <span style="font-weight: bold"><%:tpq %></span> seconds for each question.</li>
                                     
                                      <li>All the best :-)</li>
                                 </ul>
                       </div>
                            
                 
                              <br/> <br/>
                               
         <%
             if (Session["authUserID"] != null)
             {%>
                   <div style="position: relative;left: 45%"> <a  href='UserQuizForm.aspx?sid=<%:sid %>&cid=<%:cid %>'  class="btn btn-primary btn-lg">
                           Start Test.....   </a>     </div>
             <%}
             else
             {%>
                   <h4 style="text-align: center" class="alert alert-danger">opps! You need to login to take this test.Please login using your account first</h4>  
                            
                                    
            <% } %>
      


                      
                             <%}
                             else
                            {%>
                               <h4 style="text-align: center"  class="alert alert-danger">opps! It seems you have already taken this test before.This time you are not allowed to take test on this subject.</h4>  
                            
      <%}
                               
                               %>                  
    
                      

                        <% }%>
                

  

           </div>
   
    </form>
</body>
</html>
