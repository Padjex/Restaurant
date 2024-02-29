using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace Restoran
{
    public partial class Racun : Form
    {
        public Racun()
        {
            InitializeComponent();
        }

        private void Racun_Load(object sender, EventArgs e)
        {
            richTextBox1.Text = DateTime.Now.ToString();
            richTextBox1.AppendText("\n\n\t\t" + PrenosRacun.NazRestoran);
            richTextBox1.AppendText("\n\n\n");

            int x = PrenosRacun.nazivi.Count();
            int z = 0;
            double uk;
            double ukupno = 0;
            string naz;
            StringBuilder sb = new StringBuilder();

            for (int i = 0; i < x; i++)
            {
                z = i + 1;
                uk = Convert.ToDouble(PrenosRacun.cene[i]) * Convert.ToDouble(PrenosRacun.kolicine[i]);
                ukupno += uk;
                naz = PrenosRacun.nazivi[i];
                sb.Append(" "+ z.ToString() + "\t" + naz + vratiSpace(naz) + uk.ToString());
                sb.Append("\n\t\t" + PrenosRacun.kolicine[i] + " * " + PrenosRacun.cene[i]+"\n");
            }

            richTextBox1.AppendText(sb.ToString());
            richTextBox1.AppendText("\n\t\t\tUkupno: " + ukupno + "\n\n\n");

            PrenosRacun.nazivi.Clear();
            PrenosRacun.cene.Clear();
            PrenosRacun.kolicine.Clear();
        }

        //Ne radi????
        string vratiSpace(string s)
        {
            string pom = "";
            int br = 0;

            foreach (char c in s) { br++; }
            //MessageBox.Show(br.ToString());
            for (int i = 0; i < (44 - br); i++)
            { pom += " "; }

            return pom;
        }
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string s;
                if (PrenosRacun.sifRestorna == "R0")
                {
                    s = @"C:\Users\PredragJokovic\Documents\ITS\Programerski alati C#\Projekti\Restoran\Racuni\Racuni R0";
                }
                else if (PrenosRacun.sifRestorna == "R1")
                {
                    s = @"C:\Users\PredragJokovic\Documents\ITS\Programerski alati C#\Projekti\Restoran\Racuni\Racuni R1";
                }
                else if (PrenosRacun.sifRestorna == "R2")
                {
                    s = @"C:\Users\PredragJokovic\Documents\ITS\Programerski alati C#\Projekti\Restoran\Racuni\Racuni R2";
                }
                else
                {
                    s = @"C:\Users\PredragJokovic\Documents\ITS\Programerski alati C#\Projekti\Restoran\Racuni\Racuni R3";
                }

                string naziv1 = DateTime.Now.Month + "." + DateTime.Now.Day + ".txt";
                string naziv = Path.Combine(s, naziv1);

                if (!File.Exists(naziv))
                {
                    File.WriteAllText(naziv,richTextBox1.Text);
                }
                else
                {
                    File.AppendAllText(naziv,richTextBox1.Text);
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            this.Close();
        }
    }
}
