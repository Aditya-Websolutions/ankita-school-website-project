using System;
using System.Data.SqlClient;

namespace AnkitaLaxmiFinal
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStudentInfo();
            }
        }

        private void BindStudentInfo()
        {
            // Assuming you have stored StudentID in Session["StudentID"]
            string studentID = Session["StudentID"].ToString();

            using (SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                string query = "SELECT Name, Class, RollNo, DOB, BloodGroup, PhoneNumber, Address FROM Students WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblName.Text = reader["Name"].ToString();
                    lblClass.Text = reader["Class"].ToString();
                    lblRollNo.Text = reader["RollNo"].ToString();
                    lblDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("dd-MM-yyyy");
                    lblBloodGroup.Text = reader["BloodGroup"].ToString();
                    lblPhoneNumber.Text = reader["PhoneNumber"].ToString();
                    lblAddress.Text = reader["Address"].ToString();
                }
            }
        }
    }
}
