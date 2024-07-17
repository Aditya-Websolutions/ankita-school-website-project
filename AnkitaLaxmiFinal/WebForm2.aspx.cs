using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace AnkitaLaxmiFinal
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStudentInfo();
                BindGridView();
            }
        }

        private void BindStudentInfo()
        {
            string studentID = Session["StudentID"].ToString();

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                string query = "SELECT Name, Class, RollNo FROM Students WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblName.Text = reader["Name"].ToString();
                    lblClass.Text = reader["Class"].ToString();
                    lblRollNo.Text = reader["RollNo"].ToString();
                }
            }
        }

        private void BindGridView()
        {
            string studentID = Session["StudentID"].ToString();

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                string query = "SELECT Date, Status FROM Attendance WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
        }
    }
}
