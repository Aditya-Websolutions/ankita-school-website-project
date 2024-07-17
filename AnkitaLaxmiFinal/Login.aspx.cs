using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace AnkitaLaxmiFinal
{
    public partial class Login : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT StudentID FROM Students WHERE Username = @Username AND Password = @Password";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    Session["StudentID"] = result.ToString();
                    Response.Redirect("WebForm1.aspx");
                }
                else
                {
                    // Handle login failure
                }
            }
        }
    }
}
