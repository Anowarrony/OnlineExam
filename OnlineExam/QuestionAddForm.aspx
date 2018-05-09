<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionAddForm.aspx.cs" Inherits="OnlineExam.QuestionAddForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    
      <link href="Bootstrape/bootstrap.min.css" rel="stylesheet" />
       <link href="Content/style.css" rel="stylesheet" />
</head>
<body> <div class="login-card" style="width: 60%">
    <h3 style="text-align: center">        <asp:Label ID="QuestionAddSuccessLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Large" ForeColor="#408080"></asp:Label></h3>
    <form id="form1" runat="server" >
  <table  style="border-collapse: separate;border-spacing: 6px;">
    <tr>
      <td >
        <strong>  Select Subject Name </strong>
      </td>
   
      <td >
          <asp:DropDownList   ID="SubjectDropDownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="SubjectName" Width="350px" DataValueField="SubjectId" CssClass="form-control" ></asp:DropDownList>
       
        
          <asp:RequiredFieldValidator ID="SubjectReqValidator" runat="server" ControlToValidate="SubjectDropDownList" ErrorMessage="Required!" ForeColor="Red"></asp:RequiredFieldValidator>
       
        
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExamConnectionString3 %>" SelectCommand="SELECT [SubjectId], [SubjectName] FROM [tblSubject]"></asp:SqlDataSource>
          </td >
          </tr> 
    <tr>
        <td > <strong>Enter Question </strong></td>
   
	    <td>
            <asp:TextBox ID="QuestionTextBox" runat="server"  CssClass="form-control" Height="60px" Width="350px"></asp:TextBox>
            <asp:Label ID="LabelQuestion" runat="server" ForeColor="#FF8080" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
      <td ><strong>Enter Answer1 </strong></td>
   
      <td>
          <asp:TextBox ID="Ans1TextBox" runat="server"  CssClass="form-control" Height="42px" Width="353px"></asp:TextBox>
          <asp:Label ID="LabelAns1" runat="server" ForeColor="#FF8080" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
      <td ><strong>Enter Answer2 </strong></td>
 
      <td>
          <asp:TextBox ID="Ans2TextBox" runat="server"  CssClass="form-control" Height="39px" Width="353px"></asp:TextBox>
          <asp:Label ID="LabelAns2" runat="server" ForeColor="#FF8080" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
      <td ><strong>Enter Answer3 </strong></td>

      <td>
          <asp:TextBox ID="Ans3TextBox" runat="server"  CssClass="form-control" Height="40px" Width="355px"></asp:TextBox>
          <asp:Label ID="LabelAns3" runat="server" ForeColor="#FF8080" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
      <td ><strong>Enter Answer4</strong></td>

      <td>
          <asp:TextBox ID="Ans4TextBox" runat="server"  CssClass="form-control" Height="43px" Width="352px" ></asp:TextBox>
          <asp:Label ID="LabelAns4" runat="server" ForeColor="#FF8080" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
      <td ><strong>Enter True Answer </strong></td>
   
      <td>
          <asp:TextBox ID="TrueAnsTextBox" runat="server" CssClass="form-control" Height="42px" Width="353px"></asp:TextBox>
          <asp:Label ID="LabelTrueAns" runat="server" ForeColor="#FF8080" Text="Label"></asp:Label>
        </td>
    </tr>
    <tr>
   <td></td>
      <td  align="left">
          <asp:Button ID="BtnQuestionSubmit" runat="server" OnClick="BtnQuestionSubmit_Click" Text="Save Question" Width="183px" CssClass="alert-info" Height="43px"/>
        </td><td> <asp:HyperLink ID="HyperLink1" NavigateUrl="AdminIndex.aspx" runat="server">
                          GO back to Previous page
                  </asp:HyperLink></td>
    </tr>
     
  </table>
        <p>

        </p>
    </form>
    </div>
</body>
</html>
