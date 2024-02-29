using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;


namespace Restoran
{
    class PrenosSank
    {

        //Za popunjavanje dgv
        public static List<string> redniBrojevi = new List<string>();
        public static List<string> naziv = new List<string>();
        public static List<string> cena = new List<string>();
        public static List<string> kolicina = new List<string>();

        public static string sifraSto;
    }
}
