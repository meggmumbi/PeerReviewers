using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class Institution : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {/*
            if (!IsPostBack)
            {
                var nav = Config.ReturnNav();
                bool isNew = true;
                if (Convert.ToString(Session["type"]) == "old")
                {
                    isNew = false;
                }

                    var accreditationTypes = nav.FeeSchedules.Where(r => r.Applies_To_New == isNew);
                accreditationType.DataSource = accreditationTypes;
                accreditationType.DataValueField = "Code";
                accreditationType.DataTextField = "Description";
                accreditationType.DataBind();
              
                  
                    List<string> sponsors = new List<string>();
                    sponsors.Add("Government");
                    sponsors.Add("Individual");
                    sponsor.DataSource = sponsors;
                    sponsor.DataBind();
                    var counties = nav.homecounties;
                    county.DataSource = counties;
                    county.DataValueField = "Code";
                    county.DataTextField = "County_Name";
                    county.DataBind();
                    
                    var postCodes = nav.postcodes;
                    postCode.DataSource = postCodes;
                    postCode.DataValueField = "Code";
                    postCode.DataTextField = "Code";
                    postCode.DataBind();


                var constutuencyCode = "";
                if (!(Convert.ToString(Session["type"]) == "old"))
                {
                    int code = Convert.ToInt32(Session["Code"]);
                    var users = nav.UniversitySignup.Where(r => r.Code == code);
                    foreach (var user in users)
                    {
                        proposedName.Text = user.Proposed_Name;
                       
                        kraPin.Text = user.Kra_Pin;
                        proposedLocation.Text = user.Proposed_Location;
                        try
                        {
                        county.SelectedValue = user.County;
                            }
                                catch (Exception t)
                            {

                            }
                          try
                        {
                            constutuencyCode = user.Constituency;
                            }
                        catch (Exception t)
                        {
                            
                        }
                        postAddress.Text = user.Post_Address;
                        postCode.SelectedValue = user.Post_Code;
                        institutionWebsite.Text = user.Institution_Website;
                        phoneNumber.Text = user.Phone_Number;
                        emailAddress.Text = user.Email_Address;
                    }
                }
                UpdateCity();
                filterConstituencies();
                try
                {
                    if (!(string.IsNullOrEmpty(constutuencyCode)))
                    {
                        constituency.SelectedValue = constutuencyCode;
                    }
                }
                catch (Exception t)
                {

                }
            }
            */

        }

        protected void accreditationType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void apply_Click(object sender, EventArgs e)
        {/*
            try
            {

            List<string> errors = new List<string>();
          if (coverLetter.HasFile && proposalDocument.HasFile && kraCopy.HasFile && paymentDoc.HasFile)
          {
                    bool isNew = true;
                if (Convert.ToString(Session["type"]) == "old")
                {
                    isNew = false;
                }
               
                    string tProposedName = proposedName.Text.Trim(),
                  tKraPin = kraPin.Text.Trim(),
                  tProposedLocation = proposedLocation.Text.Trim(),
                  tCounty = county.SelectedValue,
                  tConstituency = constituency.SelectedValue,
                  tPostAddress = postAddress.Text.Trim(),
                  tPostCode = postCode.SelectedValue,
                  tInstitutionWebsite = institutionWebsite.Text.Trim(),
                  tPhoneNumber = phoneNumber.Text.Trim(),
                  tEmailAddress = emailAddress.Text.Trim();
                  int tSponsor = sponsor.SelectedIndex;

                    string response =  new Config().ObjNav().ApplyForAccreditation(tProposedName, tProposedLocation, tPostAddress,
                        tPostCode, tEmailAddress, accreditationType.SelectedValue, tInstitutionWebsite,
                        Convert.ToString(Session["Code"]),(string)Session["Password"]);
                    string[] info = response.Split('*');
              if (info[0] == "success")
              {
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + " </div>";
                        try
                            {
                            string extension = System.IO.Path.GetExtension(coverLetter.FileName);
                            string filename = info[3] + "_" + "CoverLetter." + extension;
                            coverLetter.SaveAs(Server.MapPath("~/Documents/") + filename);

                             extension = System.IO.Path.GetExtension(proposalDocument.FileName);
                             filename = info[3] + "_" + "ProposalDocument." + extension;
                            proposalDocument.SaveAs(Server.MapPath("~/Documents/") + filename);
                            extension = System.IO.Path.GetExtension(kraCopy.FileName);
                             filename = info[3] + "_" + "KraPin." + extension;
                            kraCopy.SaveAs(Server.MapPath("~/Documents/") + filename);

                            extension = System.IO.Path.GetExtension(paymentDoc.FileName);
                             filename = info[3] + "_" + "PaymentDoc." + extension;
                            paymentDoc.SaveAs(Server.MapPath("~/Documents/") + filename);
                            
                            //&& .HasFile && .HasFile
                            }
                            catch (Exception ex)
                            {
                          //  feedback.InnerHtml = "<div class='alert alert-danger'>We have experienced an error while uploading the documents</div>";
                        }
                        }
                    
              else
              {
                        feedback.InnerHtml = "<div class='alert alert-danger'>"+info[1]+" </div>";
                    }
              
                }
            else
          {
              feedback.InnerHtml = "<div class='alert alert-danger'>Please attach all documents</div>";
          }

         

            }
            catch (Exception)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>We encountered an error while creating your request. Please try again later. </div>";
            }
            */
        }
        protected void postCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateCity();
        }

        public void UpdateCity()
        {
            var nav = Config.ReturnNav();
            var cities = nav.postcodes.Where(r => r.Code == postCode.SelectedValue);
            foreach (var myCity in cities)
            {
                city.Text = myCity.City;
            }
        }

        public void filterConstituencies()
        {
            var nav = Config.ReturnNav();
            var cities = nav.constituencies.Where(r => r.County == county.SelectedValue);
            constituency.DataSource = cities;
            constituency.DataValueField = "Code";
            constituency.DataTextField = "Description";
            constituency.DataBind();
        }

        protected void county_SelectedIndexChanged(object sender, EventArgs e)
        {
            filterConstituencies();
        }
    }
}