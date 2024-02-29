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
using System.IO;

namespace Restoran
{
    public partial class Konobari : Form
    {
        string sifraZap = PrenosRecepcija.SifraZaposlenog;
        SqlConnection konekcija = new SqlConnection(Konekcija.konString);

        string sifraRestorana;
        string sifraSto;
        

        public Konobari()
        {
            InitializeComponent();
        }

        private void Konobari_Load(object sender, EventArgs e)
        {
            OsnovneInformacije();
            sifreStolova();
            label5.Text = DateTime.Today.ToString("dd-MM-yy");
        }
        void sifreStolova()
        {
            if (sifraRestorana == "R0")
            {
                lb21.Text = "S0"; lb22.Text = "S1"; lb41.Text = "S2"; lb42.Text = "S3";
                lb61.Text = "S4"; lb62.Text = "S5"; lb81.Text = "S6"; lb82.Text = "S7";
            }
            else if (sifraRestorana == "R1")
            {
                lb21.Text = "S8"; lb22.Text = "S9"; lb41.Text = "S10"; lb42.Text = "S11";
                lb61.Text = "S12"; lb62.Text = "S13"; lb81.Text = "S14"; lb82.Text = "S15";
            }
            else if (sifraRestorana == "R2")
            {
                lb21.Text = "S16"; lb22.Text = "S17"; lb41.Text = "S18"; lb42.Text = "S19";
                lb61.Text = "S20"; lb62.Text = "S21"; lb81.Text = "S22"; lb82.Text = "S23";
            }
            else
            {
                lb21.Text = "S24"; lb22.Text = "S25"; lb41.Text = "S26"; lb42.Text = "S27";
                lb61.Text = "S28"; lb62.Text = "S29"; lb81.Text = "S30"; lb82.Text = "S31";
            }
        }
        void OsnovneInformacije()
        {
            
            string kom1 = "select z.Ime,r.Naziv,r.sifrarestorana from Zaposleni ";
            kom1 += "z join Restoran r on r.SifraRestorana=z.SifraRestorana ";
            kom1 += "where z.SifraZap=@sifraZap";
            lbSifZap.Text = sifraZap;

            using (SqlCommand komanda = new SqlCommand(kom1, konekcija))
            {
                SqlDataReader reader = null;

                SqlParameter p = new SqlParameter("@sifraZap", SqlDbType.NVarChar, 15);
                komanda.Parameters.AddWithValue("@sifraZap", sifraZap);
                try
                {
                    konekcija.Open();
                    reader = komanda.ExecuteReader();
                    reader.Read();
                    lbIme.Text = reader[0].ToString();
                    lbImeRestorana.Text = reader[1].ToString();
                    PrenosRacun.NazRestoran= reader[1].ToString();
                    PrenosRecepcija.NazivRestorana = reader[1].ToString();
                    sifraRestorana = reader[2].ToString();
                    
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

        //Izmeniti da ne moze da se zatvori ukoliko ima otvorena porudzbina
        private void pictureBox7_Click(object sender, EventArgs e)
        {
            bool zatvori = true;
            foreach(var d in Controls)
            {
                if(d is DataGridView)
                {
                    DataGridView dgv = (DataGridView)d;
                    if (dgv.Rows.Count > 0)
                    {
                        zatvori = false;
                        MessageBox.Show("Ne možete zatvoriti, dok imate otvorenu porudzbinu!");
                        break;
                    }
                }
            }
            if (zatvori == true)
            {
                this.Close();
            }
        }

        double ukupno = 0;
        void otvoriMeni(DataGridView dgv,Label l,Button b,TextBox tb)
        {
            PrenosSank.sifraSto = sifraSto;
            PrenosRacun.sifRestorna = sifraRestorana;
            frmMenu frmMenu = new frmMenu();
            frmMenu.ShowDialog();
            if (frmMenu.DialogResult == DialogResult.Yes)
            {
                if (string.IsNullOrEmpty(tb.Text))
                {
                    ukupno = 0;
                }
                else
                {
                    ukupno = Convert.ToDouble(tb.Text);
                }
                int x = PrenosSank.redniBrojevi.Count();
                for(int i = 0; i < x; i++)
                {
                    dgv.Rows.Add(PrenosSank.redniBrojevi[i],PrenosSank.naziv[i],PrenosSank.cena[i],PrenosSank.kolicina[i]);
                    ukupno += Convert.ToDouble(PrenosSank.cena[i]) * Convert.ToDouble(PrenosSank.kolicina[i]);
                }
                l.Text = "Status: Zauzet";
                b.Text = "Dodaj stavku";
                tb.Text = ukupno.ToString();
                //NE RADI!!!
                //Recepcija r = Recepcija.ActiveForm();

                //NE RADI!!!
                
            }
        }

        private void btDod61_Click(object sender, EventArgs e)
        {
            sifraSto = lb61.Text;
            otvoriMeni(dgv61, lbStat61,btDod61, tb61);
        }

        private void btDod41_Click(object sender, EventArgs e)
        {
            sifraSto = lb41.Text;
            otvoriMeni(dgv41, lbStat41, btDod41, tb41);
        }

        private void btDod81_Click(object sender, EventArgs e)
        {
            sifraSto = lb81.Text;
            otvoriMeni(dgv81, lbStat81, btDod81, tb81);
        }

        private void btDod21_Click(object sender, EventArgs e)
        {
            sifraSto = lb21.Text;
            otvoriMeni(dgv21, lbStat21, btDod21, tb21);
        }

        private void btDod22_Click(object sender, EventArgs e)
        {
            sifraSto = lb22.Text;
            otvoriMeni(dgv22, lbStat22, btDod22, tb22);
        }

        private void btDod82_Click(object sender, EventArgs e)
        {
            sifraSto = lb82.Text;
            otvoriMeni(dgv82, lbStat82, btDod82, tb82);
        }

        private void btDod42_Click(object sender, EventArgs e)
        {
            sifraSto = lb42.Text;
            otvoriMeni(dgv42, lbStat42, btDod42, tb42);
        }

        private void btDod62_Click(object sender, EventArgs e)
        {
            sifraSto = lb62.Text;
            otvoriMeni(dgv62, lbStat62, btDod62, tb62);
        }
        
        void uvecajKolicinuDGV(DataGridViewCellEventArgs e,DataGridView dgv,TextBox tb)
        {
            if (e.ColumnIndex == 4)
            {
                int x = Convert.ToInt32(dgv.Rows[e.RowIndex].Cells[2].Value) + 1;
                dgv.Rows[e.RowIndex].Cells[2].Value = x;

                double uk = Convert.ToDouble(tb.Text) + Convert.ToDouble(dgv.Rows[e.RowIndex].Cells[3].Value);
                tb.Text = uk.ToString();
            }
            else if (e.ColumnIndex == 5)
            {
                int kol = Convert.ToInt32(dgv.Rows[e.RowIndex].Cells[2].Value);
                if (kol == 1)
                {
                    double uk = Convert.ToDouble(tb.Text) - Convert.ToDouble(dgv.Rows[e.RowIndex].Cells[3].Value);
                    tb.Text = uk.ToString();
                    dgv.Rows.RemoveAt(e.RowIndex);
                }
                else
                {
                    kol -= 1;
                    dgv.Rows[e.RowIndex].Cells[2].Value = kol;
                    double uk = Convert.ToDouble(tb.Text) - Convert.ToDouble(dgv.Rows[e.RowIndex].Cells[3].Value);
                    tb.Text = uk.ToString();
                }
            }
        }

        private void dgv21_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            uvecajKolicinuDGV(e, dgv21, tb21);
        }

        private void dgv81_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            uvecajKolicinuDGV(e, dgv81, tb81);
        }

        private void dgv41_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            uvecajKolicinuDGV(e, dgv41, tb41);
        }

        private void dgv61_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            uvecajKolicinuDGV(e, dgv61, tb61);
        }

        private void dgv22_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            uvecajKolicinuDGV(e, dgv22, tb22);
        }

        private void dgv82_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            uvecajKolicinuDGV(e, dgv82, tb82);
        }

        private void dgv42_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            uvecajKolicinuDGV(e, dgv42, tb42);
        }

        private void dgv62_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            uvecajKolicinuDGV(e, dgv62, tb62);
        }

        void kreirajRacun(DataGridView dgv, Label l, Label lstat,Button por,TextBox tb)
        {
            if (dgv.Rows.Count > 0)
            {
                string kom = "exec pPorudzbina @BRSTO,@BRSTAVKA,@KOLICINA";
                using (SqlCommand komanda = new SqlCommand(kom, konekcija))
                {
                    try
                    {
                        konekcija.Open();
                        int x = dgv.Rows.Count;
                        for (int i = 0; i < x - 1; i++)
                        {
                            komanda.Parameters.AddWithValue("@BRSTO", l.Text);
                            komanda.Parameters.AddWithValue("@BRSTAVKA", Convert.ToDouble(dgv.Rows[i].Cells[0].Value));
                            komanda.Parameters.AddWithValue("@KOLICINA", Convert.ToInt32(dgv.Rows[i].Cells[2].Value));

                            komanda.ExecuteNonQuery();

                            komanda.Parameters.Clear();

                            PrenosRacun.nazivi.Add(dgv.Rows[i].Cells[1].Value.ToString());
                            PrenosRacun.cene.Add(dgv.Rows[i].Cells[3].Value.ToString());
                            PrenosRacun.kolicine.Add(dgv.Rows[i].Cells[2].Value.ToString());
                        }
                        komanda.CommandText = "exec pPorudzbina @BRSTO,@BRSTAVKA,@KOLICINA,@ZAT";

                        komanda.Parameters.AddWithValue("@BRSTO", l.Text);
                        komanda.Parameters.AddWithValue("@BRSTAVKA", Convert.ToDouble(dgv.Rows[x-1].Cells[0].Value));
                        komanda.Parameters.AddWithValue("@KOLICINA", Convert.ToInt32(dgv.Rows[x-1].Cells[2].Value));
                        komanda.Parameters.AddWithValue("@ZAT", 4);

                        komanda.ExecuteNonQuery();

                        PrenosRacun.nazivi.Add(dgv.Rows[x - 1].Cells[1].Value.ToString());
                        PrenosRacun.cene.Add(dgv.Rows[x - 1].Cells[3].Value.ToString());
                        PrenosRacun.kolicine.Add(dgv.Rows[x - 1].Cells[2].Value.ToString());

                        
                        lstat.Text = "Status: Slobodan";
                        por.Text = "Otvori porudzbinu";
                        tb.Text = "0";
                        dgv.Rows.Clear();

                        Racun racun = new Racun();
                        racun.ShowDialog();
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
        }

        private void btRac41_Click(object sender, EventArgs e)
        {
            kreirajRacun(dgv41, lb41, lbStat41, btDod41, tb41);
        }

        private void btRac81_Click(object sender, EventArgs e)
        {
            kreirajRacun(dgv81, lb81, lbStat81, btDod81, tb81);
        }

        private void btRac21_Click(object sender, EventArgs e)
        {
            kreirajRacun(dgv21, lb21, lbStat21, btDod21, tb21);
        }
        private void btRac61_Click(object sender, EventArgs e)
        {
            kreirajRacun(dgv61, lb61, lbStat61, btDod61, tb61);
        }

        private void btRac22_Click(object sender, EventArgs e)
        {
            kreirajRacun(dgv22, lb22, lbStat22, btDod22, tb22);
        }

        private void btRac82_Click(object sender, EventArgs e)
        {
            kreirajRacun(dgv82, lb82, lbStat82, btDod82, tb82);
        }

        private void btRac42_Click(object sender, EventArgs e)
        {
            kreirajRacun(dgv42, lb42, lbStat42, btDod42, tb42);
        }

        private void btRac62_Click(object sender, EventArgs e)
        {
            kreirajRacun(dgv62, lb62, lbStat62, btDod62, tb62);
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
    }
}
