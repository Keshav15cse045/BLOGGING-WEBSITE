<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<script runat="server">

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // check whether file is uploaded
       

        if (FileUpload1.PostedFile != null)
        {
            string filename = FileUpload1.PostedFile.FileName.ToString();
          
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/photos/" + filename));
            string Image = "~/photos/" + filename.ToString();


            SqlConnection con = new SqlConnection(Database.ConnectionString);

            SqlCommand cmd = new SqlCommand("update users set userimg=@userimg where uid = " + Session["uid"].ToString() , con);

            cmd.Parameters.AddWithValue("@userimg", Image);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Change Photo</h2>
    <p>
        Select your photo :
        <asp:FileUpload ID="FileUpload1" runat="server" /></p>
    <p>
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />&nbsp;</p>
    <p>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>&nbsp;</p>
</asp:Content>

