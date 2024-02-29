using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Restoran
{
    public partial class frmUnosRecepcionar : Form
    {
        
        public frmUnosRecepcionar()
        {
            InitializeComponent();
        }

        private void frmUnosRecepcionar_Load(object sender, EventArgs e)
        {
            if (PrenosRecepcija.ukljuciComboStolovi == true)
            {
                comboBox1.Visible = true;
                label4.Visible = true;
                foreach(string s in PrenosRecepcija.sifreStolova)
                {
                    comboBox1.Items.Add(s);
                }
            }
            PrenosRecepcija.ukljuciComboStolovi = false;
            lbRestoran.Text = PrenosRecepcija.NazivRestorana;
            lbSto.Text = PrenosRecepcija.sifraStola;
        }

        private void btPotvrdi_Click(object sender, EventArgs e)
        {
            if (tbIme.Text != "")
            {
                if (!string.IsNullOrEmpty(maskedTextBox1.Text))
                {
                    if (comboBox1.Visible == false)
                    {
                        PrenosRecepcija.PrezimeGosta = tbIme.Text;
                        PrenosRecepcija.Telefon = maskedTextBox1.Text;
                        PrenosRecepcija.vremeP = dateTimePicker1.Value;
                        btPotvrdi.DialogResult = DialogResult.Yes;
                        this.DialogResult = DialogResult.Yes;
                    }
                    else
                    {
                        if (comboBox1.SelectedItem != null)
                        {
                            PrenosRecepcija.PrezimeGosta = tbIme.Text;
                            PrenosRecepcija.Telefon = maskedTextBox1.Text;
                            PrenosRecepcija.vremeP = dateTimePicker1.Value;
                            PrenosRecepcija.sifraStola = comboBox1.SelectedItem.ToString();
                            btPotvrdi.DialogResult = DialogResult.Yes;
                            this.DialogResult = DialogResult.Yes;
                        }
                        else
                        {
                            this.DialogResult = DialogResult.No;
                            errorProvider1.SetError(comboBox1, "Morate selektovati sto");
                            comboBox1.Focus();
                        }
                    }
                }
                else
                {
                    this.DialogResult = DialogResult.No;
                    errorProvider1.SetError(maskedTextBox1, "Niste uneli broj telefona");
                    maskedTextBox1.Focus();
                }
            }
            else
            {
                this.DialogResult = DialogResult.No;
                errorProvider1.SetError(tbIme, "Niste uneli Ime");
                tbIme.Focus();
            }
        }

        private void maskedTextBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            errorProvider1.SetError(maskedTextBox1, "");
            if (e.KeyChar == 13)
                btPotvrdi_Click(sender, e);
        }

        private void btOdustani_Click(object sender, EventArgs e)
        {
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }

        private void dateTimePicker1_Enter(object sender, EventArgs e)
        {
            errorProvider1.SetError(dateTimePicker1, "");
        }

        private void tbIme_KeyPress(object sender, KeyPressEventArgs e)
        {
            errorProvider1.SetError(tbIme, "");
        }

        private void frmUnosRecepcionar_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (this.DialogResult==DialogResult.Yes || this.DialogResult== DialogResult.Cancel)
            {
                e.Cancel = false;
            }
            else
            {
                e.Cancel = true;
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            errorProvider1.SetError(comboBox1, "");
        }
    }
}
