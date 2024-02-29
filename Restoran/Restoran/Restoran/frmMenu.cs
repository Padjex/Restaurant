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
    public partial class frmMenu : Form
    {
        List<Label> labelCENE = new List<Label>();
        SqlDataAdapter da = null;
        DataSet ds = new DataSet();

        public frmMenu()
        {
            InitializeComponent();
        }

        private void frmMenu_Load(object sender, EventArgs e)
        {
            DodajCeneLabel();
            lbBrojStola.Text = PrenosSank.sifraSto;
        }

        //Da bi menadzer mogao da menja cene
        void DodajCeneLabel()
        {
            //Pica
            labelCENE.Add(lbCenaZajacarsko); labelCENE.Add(lbCenaJelen); labelCENE.Add(lbCenaLav); labelCENE.Add(lbCenaPomorandza);
            labelCENE.Add(lbCenaJabuka); labelCENE.Add(lbCenaCaj); labelCENE.Add(lbCenaKafa); labelCENE.Add(lbCenaNes);
            //Salate
            labelCENE.Add(lbCezarCena); labelCENE.Add(lbCenaRuska); labelCENE.Add(lbCenaParadajz);
            labelCENE.Add(lbCenaMesana); labelCENE.Add(lbCenaKupus);
            //Jela
            labelCENE.Add(lbCenaPilFile); labelCENE.Add(lbCenaCev5); labelCENE.Add(lbCenaCev10); labelCENE.Add(lbCenaRaz);
            labelCENE.Add(lbCenaVes); labelCENE.Add(lbCenaMes); labelCENE.Add(lbCenaKolenica);
            
            SqlConnection konekcija = new SqlConnection(Konekcija.konString);
            

            da = new SqlDataAdapter("select cena from stavkamenija", konekcija);
            SqlCommandBuilder builder = new SqlCommandBuilder(da);

            da.Fill(ds, "Cene");
            DataTable dt = ds.Tables["Cene"];
            int br = 0;
            foreach(DataRow dr in dt.Rows)
            {
                labelCENE[br].Text = dr.ItemArray[0].ToString();
                br++;
            }
        }
        void dodajStavku(int redBr,string naz)
        {
            int kol;
            bool povecaj = false;
            
            foreach(DataGridViewRow row in dataGridView1.Rows)
            {
                if (redBr == (int)row.Cells[0].Value)
                {
                    povecaj = true;
                    kol = (int)row.Cells[2].Value+1;
                    row.Cells[2].Value = kol;
                    break;
                }
            }
            if (povecaj == false)
            {
                DataTable dt = ds.Tables["Cene"];
                dataGridView1.Rows.Add(redBr, naz, 1,dt.Rows[redBr-1].ItemArray[0]);
            }
        }

        private void btSalate_Click(object sender, EventArgs e)
        {
            panSalata.BringToFront();
        }
        private void btPice_Click(object sender, EventArgs e)
        {
            PanPica.BringToFront();
        }
        private void btGlavna_Click(object sender, EventArgs e)
        {
            PanGlavna.BringToFront();
        }

        private void btDodajPilFile_Click(object sender, EventArgs e)
        {
            dodajStavku(14, "Pileći file");
        }

        private void btDodajCev10_Click(object sender, EventArgs e)
        {
            dodajStavku(16, "Ćevapi 10kom");
        }

        private void btDodajCev5_Click(object sender, EventArgs e)
        {
            dodajStavku(15, "Ćevapi 5kom");
        }

        private void btDodajVes_Click(object sender, EventArgs e)
        {
            dodajStavku(18, "Dimljena vešalica");
        }

        private void btDodajMesano_Click(object sender, EventArgs e)
        {
            dodajStavku(19, "Mešano meso");
        }

        private void btDodajKolenicu_Click(object sender, EventArgs e)
        {
            dodajStavku(20, "Svinjnska Kolenica");
        }

        private void btDodajKafa_Click(object sender, EventArgs e)
        {
            dodajStavku(7, "Kafa");
        }

        private void btDodajJab_Click(object sender, EventArgs e)
        {
            dodajStavku(5, "Jabuka");
        }

        private void btDodajLav_Click(object sender, EventArgs e)
        {
            dodajStavku(3, "Lav 0,5l");
        }

        private void btDodajZaj_Click(object sender, EventArgs e)
        {
            dodajStavku(1, "Zajacarsko 0,5l");
        }

        private void btDodajJel_Click(object sender, EventArgs e)
        {
            dodajStavku(2, "Jelen 0,5l");
        }

        private void btDodajPom_Click(object sender, EventArgs e)
        {
            dodajStavku(4, "Pomorandza");
        }

        private void btDodajCaj_Click(object sender, EventArgs e)
        {
            dodajStavku(6, "Čaj");
        }

        private void btDodajNes_Click(object sender, EventArgs e)
        {
            dodajStavku(8, "Nes kafa");
        }

        private void btDodajCesar_Click(object sender, EventArgs e)
        {
            dodajStavku(9, "Cesar salata");
        }

        private void btDodajRusku_Click(object sender, EventArgs e)
        {
            dodajStavku(10, "Ruska salata");
        }

        private void btDodajParadajiz_Click(object sender, EventArgs e)
        {
            dodajStavku(11, "Paradajz salata");
        }

        private void btDodajMesanu_Click(object sender, EventArgs e)
        {
            dodajStavku(12, "Mešana salata");
        }

        private void btDodjaKupus_Click(object sender, EventArgs e)
        {
            dodajStavku(13, "Kupus salata");
        }
        private void btDodajRaz_Click(object sender, EventArgs e)
        {
            dodajStavku(17, "Pileći ražnjić");
        }
        //Kod koji omogucava pomeranje forme
        bool dragging = false;
        int x = 0;
        int y = 0;
        private void panel2_MouseDown(object sender, MouseEventArgs e)
        {
            dragging = true;

            x = Cursor.Position.X - this.Location.X;
            y = Cursor.Position.Y - this.Location.Y;
        }

        private void panel2_MouseMove(object sender, MouseEventArgs e)
        {
            if (dragging)
            {
                this.Location = new Point(Cursor.Position.X - x, Cursor.Position.Y - y);
                this.Update();
            }
        }

        private void panel2_MouseUp(object sender, MouseEventArgs e)
        {
            dragging = false;
        }

        private void btOtkazi_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }

       

        private void btPotvrdi_Click(object sender, EventArgs e)
        {
            if (dataGridView1.Rows.Count == 0)
            {
                MessageBox.Show("Niste uneli stavku");
                this.DialogResult = DialogResult.Cancel;
            }
            else
            {
                PrenosSank.cena.Clear();
                PrenosSank.naziv.Clear();
                PrenosSank.kolicina.Clear();
                PrenosSank.redniBrojevi.Clear();
                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                    PrenosSank.redniBrojevi.Add(row.Cells[0].Value.ToString());
                    PrenosSank.naziv.Add(row.Cells[1].Value.ToString());
                    PrenosSank.cena.Add(row.Cells[2].Value.ToString());
                    PrenosSank.kolicina.Add(row.Cells[3].Value.ToString());
                }
                this.DialogResult = DialogResult.Yes;
            }
        }
        private void frmMenu_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (this.DialogResult == DialogResult.Yes || this.DialogResult == DialogResult.Cancel)
            {
                e.Cancel = false;
            }
            else
            {
                e.Cancel = true;
            }
        }
    }
}
