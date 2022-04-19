using System;
using System.Configuration;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace CicPortal
{
    public partial class CV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                bool changed = Convert.ToBoolean(Session["ChangedPassword"]);
                if (!changed)
                {
                  //  Response.Redirect("Settings.aspx");
                }
            }
            catch (Exception)
            {
           //     Response.Redirect("Settings.aspx");
            }
        }
        //public string _getFileextension(HttpPostedFile filename)
        //{
        //    return (Path.GetExtension(filename.FileName));
        //}

        //protected void uploadCV_Click(object sender, EventArgs e)
        //{
        //    if (cvUpload.HasFile)
        //    {
        //        try
        //        {
        //            // string filesFolder = Config.FilesFolder() + "Vendor Card/";
        //            var filesFolder = Server.MapPath("~/Uploads");
        //            var newFilename = (string) Session["Name"];
        //               // string extension = Path.GetExtension(cvUpload.FileName);
        //            string extension = _getFileextension(cvUpload.PostedFile);

        //            if (new Config().IsAllowedExtension(extension))
        //                {
        //                    var vendorNo = Convert.ToString(Session["PeerCode"]);
        //                    vendorNo = vendorNo.Replace("/", "[58]");
        //                    vendorNo = vendorNo.Replace(":", "[47]");
        //                    // string documentDirectory = filesFolder + vendorNo + "/";
                           
        //                    var documentDirectory = Path.Combine(filesFolder, "Vendor Card/" + vendorNo);
        //                    string savedF0 = newFilename + "_CV" + extension;


        //                if (!Directory.Exists(documentDirectory))
        //                     Directory.CreateDirectory(documentDirectory);

        //                    // string filename = documentDirectory +"cv"+ extension;
        //                    cvUpload.SaveAs(documentDirectory +"/"+ savedF0);
        //                    feedback.InnerHtml ="<div class='alert alert-success'>Your CV was successfully uploaded. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        
        //            }
        //            else
        //            {
        //                feedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            feedback.InnerHtml = "<div class='alert alert-danger'>The document could not be uploaded. Please try again "+ex.Message+"<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

        //        }
        //    }
        //    else
        //    {
        //        feedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //    }
        //}
        //protected void Download_CV(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        feedback.InnerHtml = "";
        //        var newFilename = (string)Session["Name"];
        //        var filesFolder = Server.MapPath("~/Uploads");;
        //        var vendorNo = Convert.ToString(Session["PeerCode"]);
        //        vendorNo = vendorNo.Replace("/", "[58]");
        //        vendorNo = vendorNo.Replace(":", "[47]");
        //        var documentDirectory = Path.Combine(filesFolder, "Vendor Card/" + vendorNo);
              
        //        string filepath = documentDirectory + "/"+ newFilename + ".pdf";

        //        Response.ContentType = "application/pdf";
        //        var fileN = Path.GetFileName(filepath);
        //        Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileN);
        //        Response.TransmitFile(filepath);
        //        Response.End();

        //        //string embed = "<object data=\"{0}\" type=\"application/pdf\" width=\"1000px\" height=\"300px\">";
        //        //    embed += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
        //        //    embed += " or download <a target = \"_blank\" href = \""+filename+"\">CV</a> to view the file.";
        //        //    embed += "</object>";
        //        //    ltEmbed.Text = string.Format(embed, ResolveUrl(filename));

        //        //string filePath ="~/Downloads/"+univerNo2+".pdf";
        //        //getproformainvoices.Attributes.Add("src", ResolveUrl("~/Downloads/"+univerNo2+ ".pdf"));
        //        //Response.ContentType = "Application/pdf";
        //        //Response.AppendHeader("Content-Disposition", "attachment; filename=University Program Accreditation Proforma Invoice.pdf");
        //        //Response.Write("<script>alert('File downloaded succesfully')</script>");
        //        //Response.WriteFile(filePath);
        //        //Response.End();

        //        //Display success message.
        //        //string message = "Your details have been successfully submitted to CUE.Kindly Download the Proforma Invoice.";
        //        //string script = "window.onload = function(){ alert('";
        //        //script += message;
        //        //script += "')};";
        //        //ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        //    }
        //    catch (Exception t)
        //    {
        //        feedback.InnerHtml = "<div class='alert alert-danger'>" + t.Message +
        //                             "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

        //    }
        //}


        //protected void Delete_CV(object sender, EventArgs e)
        //{

        //    feedback.InnerHtml = "";
        //    var newFilename = (string)Session["Name"];
        //    var filesFolder = Server.MapPath("~/Uploads"); ;
        //    var vendorNo = Convert.ToString(Session["PeerCode"]);
        //    vendorNo = vendorNo.Replace("/", "[58]");
        //    vendorNo = vendorNo.Replace(":", "[47]");
        //    string filepath = filesFolder + "/Vendor Card/" + vendorNo + "/" + newFilename + ".pdf";
        //    File.Delete(filepath);
        //    Response.Redirect(Request.Url.AbsoluteUri);
        //}

        protected void uploadDocument_Click(object sender, EventArgs e)
        {
            String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "Peer Reviewer Application/";
            //String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "Staff Claim/";

            if (document.HasFile)
            {
                try
                {
                    if (Directory.Exists(filesFolder))
                    {
                        String extension = System.IO.Path.GetExtension(document.FileName);
                        if (new Config().IsAllowedExtension(extension))
                        {
                            string peercode = Convert.ToString(Session["PeerCode"]);
                            String CVNo = "CV";
                            string imprest = peercode;
                            peercode = peercode.Replace('/', '_');
                            peercode = peercode.Replace(':', '_');
                            String documentDirectory = filesFolder + peercode + ' ' + CVNo + "/";
                            Boolean createDirectory = true;
                            try
                            {
                                if (!Directory.Exists(documentDirectory))
                                {
                                    Directory.CreateDirectory(documentDirectory);
                                }
                            }
                            catch (Exception ex)
                            {
                                createDirectory = false;
                                documentsfeedback.InnerHtml =
                                                                "<div class='alert alert-danger'>'" + ex.Message + "'. Please try again" +
                                                                "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                //We could not create a directory for your documents
                            }
                            if (createDirectory)
                            {
                                string filename = documentDirectory + document.FileName;
                                if (File.Exists(filename))
                                {
                                    documentsfeedback.InnerHtml =
                                                                       "<div class='alert alert-danger'>A document with the given name already exists. Please delete it before uploading the new document or rename the new document<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                }
                                else
                                {
                                    document.SaveAs(filename);
                                    if (File.Exists(filename))
                                    {

                                        //Config.navExtender.AddLinkToRecord("Imprest Memo", imprestNo, filename, "");
                                        Config.navExtender.AddLinkToRecord("Peer Reviewer Application", imprest, filename, "");
                                        documentsfeedback.InnerHtml =
                                        "<div class='alert alert-success'>Your Curriculum Vitae was successfully uploaded. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }
                                    else
                                    {
                                        documentsfeedback.InnerHtml =
                                            "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }
                                }
                            }
                        }
                        else
                        {
                            documentsfeedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        }

                    }
                    else
                    {
                        documentsfeedback.InnerHtml = "<div class='alert alert-danger'>The document's root folder defined does not exist in the server. Please contact support. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
                catch (Exception ex)
                {
                    documentsfeedback.InnerHtml = "<div class='alert alert-danger'>'" + ex.Message + "'. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    //The document could not be uploaded
                }
            }
            else
            {
                documentsfeedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";


            }
        }
    }
}