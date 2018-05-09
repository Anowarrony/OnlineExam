<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubjectAddForm.aspx.cs" Inherits="OnlineExam.SubjectAddForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Bootstrape/bootstrap-3.3.2.min.css" rel="stylesheet" />
</head>
<body>   <% if (LabelSubjectAddSuccessMsg.Text != "")
          {%>
              
             <h3 class="alert alert-success" style="text-align: center"><asp:Label ID="LabelSubjectAddSuccessMsg" runat="server" Font-Bold="True" Font-Names="Arial"  Text="Label">
                

            </asp:Label></h3> 
    
    
    
     <%} %> 
    
    <% if (ExceptionMsgDisplayLabel.Text != "")
          {%>
              
             <h3 class="alert alert-warning" style="text-align: center"><asp:Label ID="ExceptionMsgDisplayLabel" ForeColor="rosybrown"  runat="server" Font-Bold="True"  Text="Label"></asp:Label></h3> 
    
    
    
     <%} %> 
     
    <form id="form1" runat="server" style="position: relative;left: 20%;top: 100px;">
        

    <div>
        <ul style="list-style: none">
            <li>
                
                
                   <asp:RequiredFieldValidator ID="SubjectValidator" runat="server" ControlToValidate="SubjectAddTextBox" ForeColor="red" ErrorMessage="* Subject field is required!"></asp:RequiredFieldValidator>
      

            </li>
              <li>   <asp:RequiredFieldValidator ControlToValidate="TimePerQuesTextBox" ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Time field is required Required!" ForeColor="red"></asp:RequiredFieldValidator>
            </li>
          
        </ul>
    </div>
      <span style="color: darkgrey;font-weight: bold">  <span style="font-size: 23px">* </span> indicates fields must be filled.</span> 
        <hr/>
        <table style="border-collapse: separate;border-spacing: 6px;">
            <tr>
                <td>
                <span style="color:darkorange">* </span>    Subject   
                </td>
                  <td> <asp:TextBox ID="SubjectAddTextBox" CssClass="form-control" runat="server" ></asp:TextBox></td>
                  <td>        <asp:Label ID="LabelSubjectAddReqMsg" runat="server" Font-Bold="True" ForeColor="#FF8080" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>
                     <span style="color:darkorange">* </span>    <asp:Label ID="Label1" runat="server" Text="Select category"></asp:Label>
                </td>
                <td>  
                <asp:DropDownList CssClass="form-control" ID="CategoryDropdownList" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryId">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineExamConnectionString4 %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [tblCategory]"></asp:SqlDataSource>
                  
       </td>
            </tr>
            
               <tr>
                   <td> <span style="color:darkorange">* </span> Time Per Question<span style="color: darkgray; " > (in Second.i.e. 70)</span></td>
                <td >  
                      <asp:TextBox ID="TimePerQuesTextBox" runat="server" ></asp:TextBox>
        </td>
           
                   
                    </tr>

                <tr>
                <td>Mark per Question</td>
                <td style="">  
                      <asp:TextBox ID="MarkPerQuestionTextBox" runat="server"></asp:TextBox>
        </td>
            </tr>
            

            <tr>
                <td>Pass Mark<span style="color: darkgray;"> (in Percentage(%))</span> </td>
                <td style="">  
                    <asp:TextBox ID="PassMarkTextBox" runat="server"></asp:TextBox>
        </td>
            </tr>
            

            <tr>
                    <td></td>
                <td>  <asp:Button ID="BtnSubjectAdd" runat="server" OnClick="BtnSubjectAdd_Click" style="margin-left: 20px" Text="Save Subject" Width="126px"  CssClass="btn btn-info"/>
                    
                    <asp:HyperLink ID="HyperLink1" NavigateUrl="AdminIndex.aspx" runat="server">
                          GO back to Previous page
                  </asp:HyperLink></td>
            </tr>
        </table>

 
  
 
    </form>
</body>
</html>
