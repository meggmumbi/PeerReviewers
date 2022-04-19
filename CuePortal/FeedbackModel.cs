using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CicPortal
{
    public class FeedbackModel
    {
        public string TfeedbackNo { get; set; }
        public string TcomponentCode { get; set; }
        public decimal Tmaximumscore { get; set; }
        public decimal Tscore { get; set; }
    }
}