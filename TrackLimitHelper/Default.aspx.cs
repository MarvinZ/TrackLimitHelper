using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TrackLimitHelper
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            //Naa
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
            if (RadComboBox1.SelectedValue == "")
            {
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "No track has been selected!!";
                Label1.Visible = true;
            }
           
            else
            {
                string operation = RadDropDownList2.SelectedValue.ToString();
                switch (operation)
                {
                    case "Set to Major Events Limits":
                        Operation("_im_TrackLimitsManager_SetToMajorEventLimits", "set to major event limits.");
                        break;
                    case "Set to Track A Limits":
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "Set to Track A Limits NOT READY";
                          Label1.Visible = true;
                        break;
                    case "Set to Track B Limits":
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "Set to Track B Limits NOT READY";
                          Label1.Visible = true;
                        break;
                    case "Set to Track C Limits":
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "Set to Track C Limits NOT READY";
                          Label1.Visible = true;
                        break;
                    case "Set to Track D Limits":
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "Set to Track D Limits NOT READY";
                          Label1.Visible = true;
                        break;
                    case "Set to Track E Limits":
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = "Set to Track E Limits NOT READY";
                          Label1.Visible = true;
                        break;
                    case "Reset to Original Limits":
                        Operation("_im_TrackLimitsManager_SetToOriginalLimits", "set back to it's original limits.");
                        break;      
                
                    default:
                        Label1.ForeColor = System.Drawing.Color.Green;
                          Label1.Text = "This is the Default action - NOTHING ACTUALLY HAPPENED";
                          Label1.Visible = true;
                        break;
                }                              
            }                      
        }


        protected void Operation(string procedure, string confirmationMessage)
        {            
                using (SqlConnection conn40 = new SqlConnection("Data Source=srv-db8;Integrated Security=False;User ID=MarvinWS;Password=m@Rv1nW$49728;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False"))
                using (SqlCommand cmd40 = new SqlCommand(procedure, conn40))  //Store Procedure 
                {
                    conn40.Open();
                    try
                    {
                        cmd40.Parameters.Add("@TrackID", SqlDbType.Int).Value = RadComboBox1.SelectedValue;

                        if (User.Identity.IsAuthenticated)
                            cmd40.Parameters.Add("@LoginName", SqlDbType.NVarChar).Value = User.Identity.Name;
                        else
                            cmd40.Parameters.Add("@LoginName", SqlDbType.NVarChar).Value = "No user identity available."; 
                        
                      
                        cmd40.CommandType = CommandType.StoredProcedure;
                        cmd40.ExecuteNonQuery();
                        Label1.ForeColor = System.Drawing.Color.Green;
                        Label1.Text = RadComboBox1.Text + " is now " + confirmationMessage; // Confirmation message
                        Label1.Visible = true;
                        conn40.Close();
                    }
                    catch (Exception e2)
                    {
                        Label1.ForeColor = System.Drawing.Color.Red;
                        Label1.Text = "Houston we have a problem! " + e2.ToString();
                        Label1.Visible = true;
                        Console.WriteLine("{0} Exception caught.", e2);
                        conn40.Close();
                    }
                }
            
        }


        protected void RadButton3_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn40 = new SqlConnection("Data Source=srv-db8;Integrated Security=False;User ID=MarvinWS;Password=m@Rv1nW$49728;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False"))
            using (SqlCommand cmd40 = new SqlCommand("BackupLimitSetTrack", conn40))
            {
                conn40.Open();
                try
                {                   
                    cmd40.CommandType = CommandType.StoredProcedure;
                    cmd40.ExecuteNonQuery();
                    Label1.ForeColor = System.Drawing.Color.Green;
                    Label1.Text = "New limits have been stored.";
                    Label1.Visible = true;
                    conn40.Close();
                }
                catch (Exception e2)
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Houston we have a problem!" + e2.ToString();
                    Label1.Visible = true;
                    Console.WriteLine("{0} Exception caught.", e2);
                    conn40.Close();
                }
            }              
        }

      

            
    }
}