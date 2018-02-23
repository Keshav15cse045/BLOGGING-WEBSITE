<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void Button1_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("adduser", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@fname", SqlDbType.NVarChar,15).Value =TextBox1.Text;
            cmd.Parameters.Add("@lname", SqlDbType.NVarChar,15).Value = TextBox2.Text;
            cmd.Parameters.Add("@email", SqlDbType.NVarChar,30).Value = TextBox3.Text;
            cmd.Parameters.Add("@location", SqlDbType.NVarChar,15).Value = TextBox4.Text;
            cmd.Parameters.Add("@occupation", SqlDbType.NVarChar,15).Value = TextBox5.Text;
             cmd.Parameters.Add("@password", SqlDbType.NVarChar,15).Value = TextBox6.Text;
            //int Returncode= cmd.ExecuteNonQuery();
            int Returncode= (int)cmd.ExecuteScalar();

            if(Returncode==-1)
            {
                Label1.Text = "username already in use,please choose another username";
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
        catch(Exception ex)
        {
            Label1.Text = ex.Message;
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="auto-style1">
        <tr>
            <td><h1>Register At YourBlogs </h1></td>
        </tr>
        <tr>
            <td>First Name
            <br />
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Last Name
                <br />
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email
                <br />
                 <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Location
                <br />
                 <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Occupation
                <br />
                 <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password
                <br />
                 <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="submit" OnClick="Button1_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </form>
    
</body>
</html>
