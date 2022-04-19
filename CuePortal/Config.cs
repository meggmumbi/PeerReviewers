using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using CicPortal.OData;

namespace CicPortal
{
    public class Config
    {
        public static NAV ReturnNav()
        {

            NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
            {
                Credentials =
                    new NetworkCredential(ConfigurationManager.AppSettings["W_USER"],
                        ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"])
            };
            return nav;
        }
        public CuePortal.PeerReviewersPortal ObjNav() {
        var ws = new CuePortal.PeerReviewersPortal();
        try
        {
            var credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"],
                ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"]);
            ws.Credentials = credentials;
            ws.PreAuthenticate = true;

        }
        catch (Exception ex)
        {
            ex.Data.Clear();
        }
            return ws;
        }
        public bool IsAllowedExtension(string extension)
        {
            bool check = Convert.ToBoolean(ConfigurationManager.AppSettings["CheckFileExtensions"]);
            if (check)
            {
                var allowedFileTypes = ConfigurationManager.AppSettings["AllowedFileExtensions"];
                var info = allowedFileTypes.Split(',');
                extension = extension.Replace('.', ' ');
                extension = extension.Trim();
                extension = extension.ToLower();
                foreach (string fileExtension in info)
                {
                    var myExtension = fileExtension;
                    myExtension = myExtension.Replace('.', ' ');
                    myExtension = myExtension.Trim();
                    myExtension = myExtension.ToLower();
                    if (myExtension == extension)
                    {
                        return true;
                    }
                }

            }
            else
            {
                return true;
            }
            return false;
        }

        public static string FilesFolder()
        {
            return ConfigurationManager.AppSettings["filesFolder"];
        }
        public static string FilesLocation()
        {
            return ConfigurationManager.AppSettings["FilesLocation"];
        }
        public static string GetAlert(string type, string message)
        {
            return "<div class='alert alert-" + type + "'>" + message + " <a href = '#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        }
        public static NavExtender.NavXtender navExtender
        {
            get
            {
                var res = new NavExtender.NavXtender();
                try
                {
                    var credential = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"],
                        ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"]);
                    res.Credentials = credential;
                    res.PreAuthenticate = true;

                }
                catch (Exception ex)
                {

                    ex.Data.Clear();
                }

                return res;
            }
        }

    }
}