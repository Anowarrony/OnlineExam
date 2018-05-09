<%@ Page Language="C#"   AutoEventWireup="true" CodeBehind="AdminIndex.aspx.cs" Inherits="OnlineExam.AdminIndex" %>

<%@ Import Namespace="OnlineExam.Models" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="Bootstrape/bootstrap.css" rel="stylesheet" />
    <link href="KendoUI/kendo.common.min.css" rel="stylesheet" />
    <link href="jQueryUI/jquery-ui.css" rel="stylesheet" />
    <link href="KendoUI/kendo.uniform.min.css" rel="stylesheet" />
    <script src="jQueryUI/jquery-1.7.1.js"></script>
    <script src="jQueryUI/jquery-ui-1.8.20.js"></script>
    <script src="KendoUI/kendo.all.min.js"></script>

    <script src="Bootstrape/bootstrap.js"></script>
    <script src="Bootstrape/bootstrap-tab.js"></script>
    <script src="Bootstrape/bootstrap-dropdown.js"></script>
  

</head>
<body>

    <form id="form1" runat="server">
        
      
                  
 <nav class="navbar navbar-default" style="background: black;color: white;font-family: Arial">
  <div class="container-fluid">

    <ul class="nav navbar-nav navbar-default">
      <li ><a href="AdminIndex.aspx">Index</a></li>
    
      <li>
          <% if (Session["authAdmin"] != null)
             {
                 var ms = "admin";
          %>        
     <a href="UserSignoutForm.aspx?reqUser=<%:ms %>">Sign Out</a>

              <% } %>
                  
      </li>
   
    </ul>
  </div>
</nav>   

    <div>
        

    <h1 style="text-align: center"> 

       Welcome to Admistrative Page</h1>
       
        

    </div>
        
    
        
    
     <div class="bs-docs-example" style="position: relative">
        <ul id="myTab" class="nav nav-tabs">

            <li class="active">
                <a href="#Questions" data-toggle="tab">

                    <i class="icon-book"></i>
                   Questions
                </a>
                

            </li>
            <li>
                 <a href="#Subjects" data-toggle="tab">

                    <i class="icon-book"></i>
                  Subjects
                     
                     
                </a> 
            </li>
           
               <li class="dropdown">
           
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-plus"></i>
                    Add<b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                        <li>
                        <a href="CategoryAddAndShowForm.aspx">
                        
                           Add New Category
                        </a>
                    </li>
                    <li>
                        <a href="SubjectAddForm.aspx" >
                        
                        Add New Subject
                        </a>
                    </li>
                    
                     <li>
                        <a href="QuestionAddForm.aspx">
                        
                           Add New Question
                        </a>
                    </li>
            
                </ul>
    
            </li>

        </ul>

        
    
        <div id="myTabContent" class="tab-content">


            <div class="tab-pane fade in active" id="Questions">

                <% if (Session["authAdmin"] == null)
                   {
                       Response.Redirect("HomeForm.aspx");
                   }
                    string msg = "Are you sure to delete?";
                         var db = new OnlineExamDbConbtext();
                         var query = from q in db.Questions
                             join s in db.Subjects on q.SubjectId equals s.SubjectId
                             select  new {s.SubjectId,s.SubjectName,q.QuestionId, q.QuestionDescription, q.Ans1, q.Ans2, q.Ans3, q.Ans4, q.TrueAns};
                       %>
                      <table class='table table-bordered' id='QuestionGrid' >

                      <tr>

                      <th>Subject</th>
                        <th data-sortable='false' data-menuable='false' data-filterable='false'>Question Description</th>
                        <th data-sortable='false' data-menuable='false' data-filterable='false'>Ans1</th>
                       <th data-sortable='false' data-menuable='false' data-filterable='false'>Ans2</th>
                       <th data-sortable='false' data-menuable='false' data-filterable='false'>Ans3</th>
                       <th data-sortable='false' data-menuable='false' data-filterable='false'>Ans4</th>
                      <th data-sortable='false' data-menuable='false' data-filterable='false'>True Ans</th>
                         <th data-sortable='false' data-menuable='false' data-filterable='false'>Action</th>
                        
                        </tr>
                          <% foreach (var item in query)
                         {%>


                             <tr>
                            <td>
                                <%: item.SubjectName%> 
                           </td>
                            <td>
                                <%: item.QuestionDescription%> 
                           </td>
                            <td>
                                <%: item.Ans1%> 
                            </td>
                            <td>
                                <%: item.Ans2%> 
                           </td>
                             <td>
                                 <%: item.Ans3%> 
                             </td>
                            <td>
                                <%: item.Ans4%> 
                         </td>
                           <td>
                               <%: item.TrueAns%> 
                            </td>

                            <td>
                         <a href="QuestionDeleteForm.aspx?qid=<%: item.QuestionId %>" class='btn btn-danger btn-small' onclick="return confirm('Are you sure to delete this question parmantly?')">
                             <img src="Content/delete.png" width="15" />
                             
                              Delete
                         </a>
                               <a href="QuestionEditForm?sid=<%: item.SubjectId %>&qid=<%:item.QuestionId %>" class='btn btn-primary btn-small'  >
                                   
                                   <img src="Content/icons8-pencil-48.png" width="15"/>
                                    Edit
                               </a>
                            
                                 </td>
                             
                            </tr>


                         <% }
                    
                     %>
                  </table>
      
            </div>
            
        <div  class="tab-pane fade in" id="Subjects">
  
              <%


                  var subjects = (from s in db.Subjects
                      join c in db.Categories on s.CategoryId equals c.CategoryId
                      select (new {s.SubjectId, s.SubjectName, c.CategoryId, c.CategoryName})).ToList();
                  
                  
                             
                              %>
                      <table class='table table-bordered' id='SubjectsGrid' >

                      <tr>

              <th  data-sortable='false' data-menuable='false' data-filterable='false' style="text-align: center;width: 15%">Subject ID</th>
                        <th data-sortable='false' style="text-align: center;width: 40%" data-menuable='false' data-filterable='false'>Subject Name</th>
                <th data-sortable='false' style="text-align: center;width: 25%" data-menuable='false' data-filterable='false'>Category</th>
                        
                         <th data-sortable='false' style="text-align: center;width: 20%" data-menuable='false' data-filterable='false'>Action</th>
                          
                        </tr>
                          <% foreach (var item in subjects)
                         {%>


                             <tr>
                            <td style="text-align: center">
                                <%: item.SubjectId%> 
                           </td>
                            <td style="text-align: center">
                                <%: item.SubjectName%> 
                           </td>
                      
                                      <td style="text-align: center">
                                <%: item.CategoryName%> 
                           </td>
                            <td style="text-align: center">
                         <a href="SubjectAddForm.aspx?sid=<%: item.SubjectId %>" class='btn btn-danger btn-small' onclick="return confirm('Are you sure to delete this Subject parmantly?')">
                             <img src="Content/delete.png" width="15" />
                             
                              Delete
                         </a>
                              <a href="SubjectAddForm.aspx?sid=<%: item.SubjectId %>&cid=<%:item.CategoryId %>" class='btn btn-success btn-small'>
                           
                                  <img src="Content/icons8-pencil-48.png" width="15"/>
                              Edit
                         </a>
                            
                                 </td>
                             
                            </tr>


                         <% }
                    
                     %>
                  </table>
            
             </div>
        </div>
     



        
    

        
    </div>
        <input type="hidden" value="<%:Request.QueryString["redForm"] %>" id="redMsgHiddenBox"/>
      
        
           <div id="jQueryDialogRefDiv" style="display: none">The record Deleted Successfully.</div>
         </form>

     
     <script>
         
         $("#SubjectsGrid").kendoGrid({


             pageable: {
                 refresh: true,
                 pageSizes: true,
                 buttonCount: 5
             }

             , dataSource: { pageSize:10}
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

         $("#QuestionGrid").kendoGrid({


             pageable: {
                 refresh: true,
                 pageSizes: true,
                 buttonCount: 5
             }

              , dataSource: { pageSize: 10}
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
    
         if ($("#redMsgHiddenBox").val() == "RedFromQDF") {
       
                 $("#jQueryDialogRefDiv").dialog({modal:true});
       
          
         }
    </script>

</body>
</html>
