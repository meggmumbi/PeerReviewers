using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CicPortal
{
    public class UploadedFile
    {
        public string FileName { get; set; }
        public string Path { get; set; }
        public long Size { get; set; }
        public string vendorNo { get; set; }

        public HttpPostedFileBase krapinFile { get; set; }

        public HttpPostedFileBase helbFile { get; set; }
        public HttpPostedFileBase cidFile { get; set; }
        public HttpPostedFileBase eaccFile { get; set; }
        public HttpPostedFileBase profdFile { get; set; }
        public HttpPostedFileBase crbFile { get; set; }
    }
}