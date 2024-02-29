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
    public partial class Recepcija : Form
    {
        string sifraZap = PrenosRecepcija.SifraZaposlenog;
        SqlConnection konekcija = new SqlConnection(Konekcija.konString);


        string sifraRestorana;
        string sifraSto;

        //Za brisanje
        DataGridView dgv;

        public Recepcija()
        {
            InitializeComponent();
        }

        private void Recepcija_Load(object sender, EventArgs e)
        {
            label1.Text = DateTime.Today.ToString("dd-MM-yy");
            OsnovneInformacije();
            sifreStolova();
            unosSvihDataGridView();
        }
      
        private void pictureBox7_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Da li ste sigurni?", "Kraj radnog vremena", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                this.Close();
        }
        //Informacije koje su potrebne formi
        void OsnovneInformacije()
        {
            string kom1 = "select z.Ime,r.Naziv,r.sifrarestorana from Zaposleni ";
            kom1 += "z join Restoran r on r.SifraRestorana=z.SifraRestorana ";
            kom1 += "where z.SifraZap=@sifraZap";
            lbSifraZap.Text = sifraZap;

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
                    lbImeZap.Text = reader[0].ToString();
                    lbImeRestorana.Text = reader[1].ToString();
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
        void dataGridPopunjavanje(string s, DataGridView d, Label l)
        {
            string kom = "select * from fRec(@BrojStola)";
            using (SqlCommand komanda = new SqlCommand(kom, konekcija))
            {
                SqlParameter brSto = new SqlParameter("@BrojStola", SqlDbType.VarChar, 10);
                komanda.Parameters.AddWithValue("@BrojStola", s);

                try
                {
                    konekcija.Open();
                    SqlDataReader reader = komanda.ExecuteReader();
                    int i;
                    while (reader.Read())
                    {
                        DateTime vreme = Convert.ToDateTime(reader[2]);
                        if (Convert.ToDateTime(vreme) > DateTime.Today)
                        {
                            i = d.Rows.Add();
                            d.Rows[i].Cells[0].Value = reader[0];
                            d.Rows[i].Cells[1].Value = reader[1];
                            d.Rows[i].Cells[2].Value = reader[2];
                        }
                    }
                    reader.Close();
                    //Vraca da li je sto slobodan
                    kom = "select top 1 p.StatusP ";
                    kom += "from Porudzbina p join sto s on s.BrojStola=p.BrojStola ";
                    kom += "where s.BrojStola=@BrojStola and p.StatusP='o'";

                    SqlCommand komanda2 = new SqlCommand(kom, konekcija);
                    string g = "C";
                    komanda2.Parameters.AddWithValue("@BrojStola", s);
                    reader = komanda2.ExecuteReader();

                    if (reader.Read())
                        g = reader[0].ToString();
                    if (g == "O")
                        l.Text = "Status: Zauzet";
                    else
                        l.Text = l.Text;
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
        public void unosSvihDataGridView()
        {
            dataGridPopunjavanje(lb21.Text, dgv21, lbStat21);
            dataGridPopunjavanje(lb22.Text, dgv22, lbStat22);
            dataGridPopunjavanje(lb41.Text, dgv41, lbStat41);
            dataGridPopunjavanje(lb42.Text, dgv42, lbStat42);
            dataGridPopunjavanje(lb61.Text, dgv61, lbStat61);
            dataGridPopunjavanje(lb62.Text, dgv62, lbStat62);
            dataGridPopunjavanje(lb81.Text, dgv81, lbStat81);
            dataGridPopunjavanje(lb82.Text, dgv82, lbStat82);
        }


        private void unosRezervacijaGost()
        {
            PrenosRecepcija.sifraStola = sifraSto;
            frmUnosRecepcionar frm = new frmUnosRecepcionar();
            frm.ShowDialog();
            if (frm.DialogResult == DialogResult.Yes)
            {
                string insGost = "insert into Gost(Prezime,BrojTelefona) values(@Prezime,@BrojTefefona)";
                string insRezervacija = "INSERT INTO REZERVACIJA(VremeRezervacije,SifraGosta,BrojStola,SifraZap,SifraRestorana) VALUES ";
                insRezervacija += " (@Vreme,@SifraGosta,@BrojStola,@sifZap,@sifRestoran)";

                using (SqlCommand komanda=new SqlCommand(insGost, konekcija))
                {
                    SqlParameter prez = new SqlParameter("@Prezime",SqlDbType.VarChar,20);
                    SqlParameter tel = new SqlParameter("@BrojTefefona", SqlDbType.VarChar, 11);

                    try
                    {
                        //Unos gosta
                        konekcija.Open();
                        komanda.Parameters.AddWithValue("@Prezime", PrenosRecepcija.PrezimeGosta);
                        komanda.Parameters.AddWithValue("@BrojTefefona", PrenosRecepcija.Telefon);
                        komanda.ExecuteNonQuery();
                        komanda.Parameters.Clear();

                        //Uzimanje sifre gosta
                        int sifraGosta;
                        komanda.CommandText = "select top 1 SifraGosta from Gost order by SifraGosta desc";
                        sifraGosta = Convert.ToInt32(komanda.ExecuteScalar());

                        //Unos u rezervaciju
                        komanda.CommandText = insRezervacija;

                        komanda.Parameters.AddWithValue("@Vreme",PrenosRecepcija.vremeP);
                        komanda.Parameters.AddWithValue("@SifraGosta", sifraGosta);
                        komanda.Parameters.AddWithValue("@BrojStola",PrenosRecepcija.sifraStola);
                        komanda.Parameters.AddWithValue("@sifZap", sifraZap);
                        komanda.Parameters.AddWithValue("@sifRestoran",sifraRestorana);

                        komanda.ExecuteNonQuery();
                    }
                    catch(Exception ex)
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

        private void novaRezervacijaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            unosRezervacijaGost();
        }

        private void btNovaRez_Click(object sender, EventArgs e)
        {
            PrenosRecepcija.sifraStola = null;
            PrenosRecepcija.ukljuciComboStolovi = true;
            string kom = "Select brojStola from sto where SifraRestorana=@sifRes";
            using (SqlCommand komanda = new SqlCommand(kom, konekcija))
            {
                try
                {
                    konekcija.Open();
                    komanda.Parameters.AddWithValue("@sifRes", sifraRestorana);
                    SqlDataReader reader = komanda.ExecuteReader();
                    while (reader.Read())
                    {
                        PrenosRecepcija.sifreStolova.Add(reader[0].ToString());
                    }
                    reader.Close();
                    unosRezervacijaGost();
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

        private void brisi(DataGridView dgv)
        {
            if (dgv.SelectedRows.Count > 0)
            {
                int index = dgv.SelectedRows[0].Index;
                int sif = (int)dgv.SelectedRows[0].Cells[0].Value;
                string kom = "delete from rezervacija where sifraGosta=@sif ";
                kom += "delete from gost where sifraGosta=@sif ";
                
                using (SqlCommand komanda=new SqlCommand(kom,konekcija))
                {
                    try
                    {
                        komanda.Parameters.AddWithValue("@sif", sif);
                        konekcija.Open();
                        komanda.ExecuteNonQuery();
                        //Obrisace red koji zelim, jer dgv i dgv koji ulazi kao parametar ukazuju na istu tabelu podataka na heap memoriji
                        dgv.Rows.RemoveAt(index);
                    }
                    catch(Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                    finally
                    {
                        konekcija.Close();
                    }
                }
            }
            else
            {
                MessageBox.Show("Morate selektovati red");
            }
        }

        private void dgv61_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                sifraSto = lb61.Text;
                dgv = dgv61;
            }
        }

        private void dgv41_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                sifraSto = lb41.Text;
                dgv = dgv41;
            }
        }

        private void dgv81_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                sifraSto = lb81.Text;
                dgv = dgv81;
            }
        }

        private void dgv21_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                sifraSto = lb21.Text;
                dgv = dgv21;
            }
        }

        private void dgv22_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                sifraSto = lb22.Text;
                dgv = dgv22;
            }
        }

        private void dgv82_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                sifraSto = lb82.Text;
                dgv = dgv82;
            }
        }

        private void dgv42_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                sifraSto = lb42.Text;
                dgv = dgv42;
            }
        }

        private void dgv62_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == MouseButtons.Right)
            {
                sifraSto = lb62.Text;
                dgv = dgv62;
            }
        }

        private void pb61_Click(object sender, EventArgs e)
        {
            sifraSto = lb61.Text;
            unosRezervacijaGost();
        }

        private void pb41_Click(object sender, EventArgs e)
        {
            sifraSto = lb41.Text;
            unosRezervacijaGost();
        }
        private void pb81_Click(object sender, EventArgs e)
        {
            sifraSto = lb81.Text;
            unosRezervacijaGost();
        }
        private void pb21_Click(object sender, EventArgs e)
        {
            sifraSto = lb21.Text;
            unosRezervacijaGost();
        }
        private void pb22_Click(object sender, EventArgs e)
        {
            sifraSto = lb22.Text;
            unosRezervacijaGost();
        }
        private void pb82_Click(object sender, EventArgs e)
        {
            sifraSto = lb82.Text;
            unosRezervacijaGost();
        }
        private void pb42_Click(object sender, EventArgs e)
        {
            sifraSto = lb42.Text;
            unosRezervacijaGost();
        }

        private void pb62_Click(object sender, EventArgs e)
        {
            sifraSto = lb62.Text;
            unosRezervacijaGost();
        }

        private void izbrisiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            brisi(dgv);
        }
        
        private void osvežiToolStripMenuItem_Click(object sender, EventArgs e)
        {
            foreach (var d in Controls)
            {
                if (d is DataGridView)
                {
                    DataGridView dg = (DataGridView)d;
                    dg.Rows.Clear();
                }
            }
            unosSvihDataGridView();
        }

        private void btOsvezi_Click(object sender, EventArgs e)
        {
            foreach (var d in Controls)
            {
                if(d is DataGridView)
                {
                    DataGridView dg = (DataGridView)d;
                    dg.Rows.Clear();
                }
            }
            unosSvihDataGridView();
        }

        //Promenljive za promene nad bazom
        int index1;
        int sif;
        private void promeniVremeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (dgv.SelectedRows.Count > 0)
            {
                index1 = dgv.SelectedRows[0].Index;
                dgv.Columns[1].ReadOnly = false;
                dgv.Columns[2].ReadOnly = false;
                sif = (int)dgv.SelectedRows[0].Cells[0].Value;
            }
            else
            {
                MessageBox.Show("Selektujte red koji zelite da promenite");
            }
        }


        private void dgv41_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
            {
                string kom = "UPDATE GOST SET PREZIME=@IME WHERE SIFRAGOSTA=@SIF ";
                kom += "UPDATE REZERVACIJA SET VREMEREZERVACIJE=@VREME WHERE SIFRAGOSTA=@SIF";
                string ime = dgv.Rows[index1].Cells[1].Value.ToString();
                DateTime vreme = Convert.ToDateTime(dgv.Rows[index1].Cells[2].Value);
                dgv.ReadOnly = true;
                using (SqlCommand komanda=new SqlCommand(kom, konekcija))
                {
                    try
                    {
                        SqlParameter im = new SqlParameter("@IME", SqlDbType.VarChar, 20);
                        SqlParameter vr = new SqlParameter("@VREME", SqlDbType.SmallDateTime);
                        konekcija.Open();
                        komanda.Parameters.AddWithValue("@IME", ime);
                        komanda.Parameters.AddWithValue("@VREME", vreme);
                        komanda.Parameters.AddWithValue("@SIF", sif);
                        komanda.ExecuteNonQuery();
                    }
                    catch(Exception es)
                    {
                        MessageBox.Show(es.Message);
                    }
                    finally
                    {
                        konekcija.Close();
                    }
                }
            }
        }

        private void prikažiTelefonToolStripMenuItem_Click(object sender, EventArgs e)
        {
            string kom = "select brojtelefona from gost where sifraGosta=@sifra";
            int sifra;
            if (dgv.SelectedRows.Count > 0)
            {
                using (SqlCommand komanda = new SqlCommand(kom, konekcija))
                {
                    try
                    {
                        sifra = (int)dgv.SelectedRows[0].Cells[0].Value;
                        konekcija.Open();
                        komanda.Parameters.AddWithValue("@sifra", sifra);
                        string telefon = komanda.ExecuteScalar().ToString();
                        MessageBox.Show(telefon);
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
            else
            {
                MessageBox.Show("Selektujte red");
            }
        }


        //Kod koji omogucava pomeranje forme
        bool dragging = false;
        int x = 0;
        int y = 0;
        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            dragging = true;

            x = Cursor.Position.X - this.Location.X;
            y = Cursor.Position.Y - this.Location.Y;
        }

        private void panel1_MouseMove(object sender, MouseEventArgs e)
        {
            if (dragging)
            {
                this.Location = new Point(Cursor.Position.X - x, Cursor.Position.Y - y);
                this.Update();
            }
        }

        private void panel1_MouseUp(object sender, MouseEventArgs e)
        {
            dragging = false;
        }

        //Konstruktor da bi se znalo da je sto zauzet
        public Recepcija(Label l)
        {
            foreach (var lab in Controls)
                if (lab is Label)
                {
                    Label lb = (Label)lab;
                    if (lb.Name.Contains("Stat"))
                        if (lb.Name == l.Name)
                        {
                            lb.Text = l.Text;
                        }
                }
        }
        public string lbText
        {
            set
            {
                this.lbStat21.Text = value;
                this.lbStat22.Text = value;
                this.lbStat42.Text = value;
                this.lbStat41.Text = value;
                this.lbStat62.Text = value;
                this.lbStat61.Text = value;
                this.lbStat81.Text = value;
                this.lbStat82.Text = value;
            }
        }
        //NE RADI!!!
        public void statusSto(Label l)
        {
            foreach (var lab in Controls)
                if (lab is Label)
                {
                    Label lb = (Label)lab;
                    if (lb.Name.Contains("Stat"))
                        if (lb.Name == l.Name)
                        {
                            lb.Text = l.Text;
                        }
                }

        }
    }
}
