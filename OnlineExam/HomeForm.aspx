<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeForm.aspx.cs" Inherits="OnlineExam.HomeForm" %>
<%@ Import Namespace="OnlineExam.Models" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrape/bootstrap.min.css" rel="stylesheet" />
    <link href="Bootstrape/navbar-top.css" rel="stylesheet" />
</head>
<body>
    
    
    <nav class="navbar navbar-toggleable-md navbar-inverse bg-inverse mb-4">
      <button class="navbar-toggler navbar-toggler-left" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

    
        <% if (Session["authUserID"]==null)
           { %>
        
          <a class="navbar-brand" href="UserLoginForm.aspx" >Login</a>
        <% } %>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mr-auto ">
          <li class="nav-item active">
            <a class="nav-link" href="HomeForm.aspx" >Home </a>
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
        
    <a class="nav-link " href="HomeForm.aspx">Take a Test</a>
              
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
   <table width="100%" border="0">
  <tr>
    <td width="70%" height="25">&nbsp;</td>
    <td width="1%" rowspan="2" bgcolor="#CC3300"><span class="style6"></span></td>
  
       </tr>
  <tr>
    <td height="296" valign="top"><div align="center">
        <h1 class="style8">Wel come to Online Quiz</h1>
      <span class="style5">
          
      
          <img src="Content/paathshala.jpg" width="129" height="100">
          
          <span class="style7">
           
              <img src="Content/HLPBUTT2.JPG" width="50" height="50">
              <img src="Content/BOOKPG.JPG" width="43" height="43">
          </span>        
      </span>
        <param name="movie" value="english theams two brothers.dat">
        <param name="quality" value="high">
        <param name="movie" value="Drag to a file to choose it.">
        <param name="quality" value="high">
        <param name="BGCOLOR" value="#FFFFFF">
<p align="left" class="style5">&nbsp;</p>
      <blockquote>
          <p align="center" style="font-family: Lucida Console;color: green" class="style5"><span class="style7">Wel Come to Online 
            exam. This Site will provide the quiz for various subject of interest. 
            You need to login to take part in  the online test.</span></p>
      </blockquote>
    </div></td>

  </tr>
</table>

    </form>
    
    <%
        
        var db = new OnlineExamDbConbtext();

        var categoryData = (from c in db.Categories
                           join s in db.Subjects on c.CategoryId equals s.CategoryId
                           select (new { c.CategoryId, c.CategoryName })).Distinct();    %>
    
           
                  
       <%foreach (var categoryItem in categoryData)
        {
         
            var subjectDataForCurrentCategory = db.Subjects.Where(s => s.CategoryId.Equals(categoryItem.CategoryId)).Select(s => new {s.SubjectId, s.SubjectName});
           
            %>
       <div style="color:green;font-weight: bold;font-family: Arial;position: relative;left: 10% "><%:categoryItem.CategoryName %> Online Test</div>
            <% foreach (var subjectItem in subjectDataForCurrentCategory)
           { %>
               
           
               
                    
              
    
            
        <div style="font-family: Arial;font-weight: bold;position: relative;left: 10%  ">
            
            <img src="Content/Screenshot_3.png" width="20"/>
            
           <a  href='TestStartAndDetailsForm.aspx?sid=<%:subjectItem.SubjectId %>&cid=<%:categoryItem.CategoryId %>&catName=<%:categoryItem.CategoryName %>' >  <%:subjectItem.SubjectName %></a>
        </div><br/>
          
           
            
           <% }%> 
       
        <br/><br/>
       <% } %>  
        











    

</body>
</html>
