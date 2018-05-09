<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionEditForm.aspx.cs" Inherits="OnlineExam.QuestionEditForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrape/bootstrap.css" rel="stylesheet" />


    <script src="Scripts/jquery-1.10.2.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 152px;
        }
        input{ width: 250px;height: 30px}
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <table   align="center" style="border-collapse: separate;border-spacing: 4px; width: 61%;">
    <tr>
      <td class="auto-style1" >
          <div align="left"><strong> Subject Name </strong></div>
      </td>
      <td >  
          <asp:DropDownList Width="200px" ID="SubjectDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="SubjectName" DataValueField="SubjectId" CssClass="badge-warning" Height="43px"></asp:DropDownList>
       
        
          </td >
       
        <td>  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExamConnectionString3 %>" SelectCommand="SELECT [SubjectId], [SubjectName] FROM [tblSubject]"></asp:SqlDataSource>
 
      <asp:HiddenField ID="SubjectDropdownlistHiddenField" runat="server"/>
        </td>
        
        </tr>
    <tr>
        <td class="auto-style1" ><div align="left"><strong>  Question </strong></div></td>
        <td><input type="text" name="QuestionTextBox" style="height: 60px" id="questionBoxId" class="form-control"/></td>
	    <td >
            <asp:HiddenField ID="QuestionHiddenTextBox" runat="server" ></asp:HiddenField>
        </td>
    </tr>
    <tr>
      <td class="auto-style1" ><div align="left"><strong> Answer1 </strong></div></td>
      <td><input type="text" name="Ans1TextBox" id="Ans1BoxId"/></td>
      <td >
          <asp:HiddenField ID="Ans1HiddenTextBox" runat="server" ></asp:HiddenField>
        </td>
    </tr>
    <tr>
      <td class="auto-style1" ><strong> Answer2 </strong></td>
      <td>
           <input type="text" name="Ans2TextBox" id="Ans2BoxId"/></td>
      <td>
           <asp:HiddenField ID="Ans2HiddenTextBox" runat="server" ></asp:HiddenField>
        </td>
    </tr>
    <tr>
      <td class="auto-style1" ><strong> Answer3 </strong></td>
      <td>
       <input type="text" name="Ans3TextBox" id="Ans3BoxId"/></td>
      <td >
          <asp:HiddenField ID="Ans3HiddenTextBox" runat="server" ></asp:HiddenField>
        </td>
    </tr>
    <tr>
      <td class="auto-style1" ><strong> Answer4</strong></td>
      <td>
           <input type="text" name="Ans4TextBox" id="Ans4BoxId"/></td>
      <td >
           <asp:HiddenField ID="Ans4HiddenTextBox" runat="server" ></asp:HiddenField>
        </td>
    </tr>
    <tr>
      <td class="auto-style1" ><strong> True Answer </strong></td>
      <td>
          <input type="text" name="TrueAnsTextBox" id="TrueAnsBoxId"/></td>
      <td >
          <asp:HiddenField ID="TrueAnsHiddenTextBox" runat="server" ></asp:HiddenField>
        </td>
    </tr>
    <tr>
      <td class="auto-style1" ></td>
      <td>
          <asp:Button ID="BtnQuestionEdit" runat="server"  Text="Save Changes" Width="183px" CssClass="badge-info" Height="43px" Font-Bold="True" ForeColor="White" OnClick="BtnQuestionEdit_Click"/>
          </td>
      <td >
         </td>
    </tr>
          <tr><td class="auto-style1" ></td>      <td ></td>
              <td > <asp:HyperLink ID="HyperLink1" NavigateUrl="AdminIndex.aspx" runat="server">
                    <i class="glyphicon glyphicon-backward"></i>      GO back to Previous page
                  </asp:HyperLink></td>
        
          </tr>
  </table>
    
    </form>
    <script>
     
        $('#SubjectDropDownList option').filter(function () {
            return ($(this).text() == $("#SubjectDropdownlistHiddenField").val()); 
        }).attr('selected', true);
        $("#questionBoxId").val($("#QuestionHiddenTextBox").val());
        $("#Ans1BoxId").val($("#Ans1HiddenTextBox").val());
        $("#Ans2BoxId").val($("#Ans2HiddenTextBox").val());
        $("#Ans3BoxId").val($("#Ans3HiddenTextBox").val());
        $("#Ans4BoxId").val($("#Ans4HiddenTextBox").val());
        $("#TrueAnsBoxId").val($("#TrueAnsHiddenTextBox").val());
    </script>
</body>
</html>
