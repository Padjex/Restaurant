using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Restoran
{
    public partial class LOGIN : Form
    {
        public LOGIN()
        {
            InitializeComponent();
        }
        SqlConnection konekcija = new SqlConnection(Konekcija.konString);
        private List<string> sifreZap = new List<string>();
        private List<string> sifRadnoMesto = new List<string>();
        private List<string> lozinkaZap = new List<string>();
        
        private void Form1_Load(object sender, EventArgs e)
        {
            //Komanda za SQl
            string k = "select z.SifraZap,z.Lozinka,t.SifraRM";
            k += " from Zaposleni z join Angazovanje a on a.SifraZap=z.SifraZap ";
            k += "join TipRadnogMesta t on t.SifraRM=a.SifraRM";
            k += " where t.SifraRM !='RM-3'";
            

            using (SqlCommand komanda = new SqlCommand(k, konekcija))
            {
                try
                {
                    konekcija.Open();
                    SqlDataReader reader = null;
                    reader = komanda.ExecuteReader();
                    while (reader.Read())
                    {
                        cbID.Items.Add(reader[0]);
                        sifreZap.Add(reader[0].ToString());
                        lozinkaZap.Add(reader[1].ToString());
                        sifRadnoMesto.Add(reader[2].ToString());
                    }
                    cbID.SelectedIndex = 0;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
                finally
                {
                    konekcija.Close();
                }
            }
        }

        private void btZatvori_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void tbLozinka_Enter(object sender, EventArgs e)
        {
            tbLozinka.Clear();
            tbLozinka.PasswordChar = '*';
        }
        public static string s = "";
        private void btPrijava_Click(object sender, EventArgs e)
        {
            if (tbLozinka.Text == lozinkaZap[cbID.SelectedIndex])
            {
                PrenosRecepcija.SifraZaposlenog = sifreZap[cbID.SelectedIndex];
                if (sifRadnoMesto[cbID.SelectedIndex] == "RM-1")
                {
                    Menadjment m = new Menadjment();
                    m.Show();
                }
                else if (sifRadnoMesto[cbID.SelectedIndex] == "RM-2")
                {
                    Konobari k = new Konobari();
                    k.Show();
                }
                else
                {
                    Recepcija r = new Recepcija();
                    r.Show();
                }
            }
            else
            {
                textBox1.Text = "NETAČNA LOZINKA!";
                tbLozinka.Focus();
                tbLozinka.Clear();
            }
        }
        private void tbLozinka_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (tbLozinka.Text.Length > 0)
                textBox1.Text = "";
            if (e.KeyChar == 13)
                btPrijava_Click(sender, e);
        }

        private void cbID_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbLozinka.Focus();
        }

        //Kako bi izbrisao "VAS ID"
        int br = 0;
        private void cbID_Enter(object sender, EventArgs e)
        {
            if (br == 0)
            {
                cbID.Items.RemoveAt(0); br++;
            }
        }

        private void cbID_DrawItem(object sender, DrawItemEventArgs e)
        {
            var Brush = Brushes.Black;

            var Point = new Point(2, e.Index * e.Bounds.Height + 1);
            int index = e.Index >= 0 ? e.Index : 0;

            e.Graphics.FillRectangle(new SolidBrush(Control.DefaultBackColor), new Rectangle(Point, e.Bounds.Size));
            e.Graphics.DrawString(cbID.Items[index].ToString(), e.Font, Brush, e.Bounds, StringFormat.GenericDefault);
        }
    }
}
