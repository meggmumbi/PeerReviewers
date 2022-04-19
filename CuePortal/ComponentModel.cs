using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CicPortal
{
    public class ComponentModel
    {
        public string evalNo { get; set; }
        public string component { get; set; }
        public string subcomponent { get; set; }
        public string strength { get; set; }
        public string weakness { get; set; }
        public string recommendation { get; set; }
        public decimal maximumscore { get; set; }
        public decimal score { get; set; }
        public string mystatus { get; set; }
        public string applicationNo { get; set; }

    }
}