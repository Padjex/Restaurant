
namespace Restoran
{
    partial class frmUnosRecepcionar
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.dateTimePicker1 = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.tbIme = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btOdustani = new System.Windows.Forms.Button();
            this.btPotvrdi = new System.Windows.Forms.Button();
            this.lbRestoran = new System.Windows.Forms.Label();
            this.lbSto = new System.Windows.Forms.Label();
            this.maskedTextBox1 = new System.Windows.Forms.MaskedTextBox();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.label4 = new System.Windows.Forms.Label();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.restoranDataSet = new Restoran.RestoranDataSet();
            this.stoBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.stoTableAdapter = new Restoran.RestoranDataSetTableAdapters.StoTableAdapter();
            this.stoBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.restoranDataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.stoBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.stoBindingSource1)).BeginInit();
            this.SuspendLayout();
            // 
            // dateTimePicker1
            // 
            this.dateTimePicker1.CustomFormat = "MMMMdd, yyyy  |  hh:mm";
            this.dateTimePicker1.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dateTimePicker1.Location = new System.Drawing.Point(32, 95);
            this.dateTimePicker1.Margin = new System.Windows.Forms.Padding(6, 4, 6, 4);
            this.dateTimePicker1.MaxDate = new System.DateTime(2022, 12, 25, 23, 59, 59, 0);
            this.dateTimePicker1.MinDate = new System.DateTime(2022, 3, 19, 0, 0, 0, 0);
            this.dateTimePicker1.Name = "dateTimePicker1";
            this.dateTimePicker1.Size = new System.Drawing.Size(363, 26);
            this.dateTimePicker1.TabIndex = 0;
            this.dateTimePicker1.Enter += new System.EventHandler(this.dateTimePicker1_Enter);
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.SystemColors.ControlDark;
            this.label1.Dock = System.Windows.Forms.DockStyle.Top;
            this.label1.Font = new System.Drawing.Font("Lucida Fax", 27.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(0, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(425, 44);
            this.label1.TabIndex = 1;
            this.label1.Text = "Rezervacija";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // tbIme
            // 
            this.tbIme.Location = new System.Drawing.Point(197, 154);
            this.tbIme.Name = "tbIme";
            this.tbIme.Size = new System.Drawing.Size(148, 26);
            this.tbIme.TabIndex = 1;
            this.tbIme.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tbIme_KeyPress);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(65, 157);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 18);
            this.label2.TabIndex = 4;
            this.label2.Text = "Na Ime";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(65, 207);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(74, 18);
            this.label3.TabIndex = 5;
            this.label3.Text = "Telefon";
            // 
            // btOdustani
            // 
            this.btOdustani.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.btOdustani.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btOdustani.Location = new System.Drawing.Point(32, 316);
            this.btOdustani.Name = "btOdustani";
            this.btOdustani.Size = new System.Drawing.Size(159, 33);
            this.btOdustani.TabIndex = 6;
            this.btOdustani.Text = "Odustani";
            this.btOdustani.UseVisualStyleBackColor = false;
            this.btOdustani.Click += new System.EventHandler(this.btOdustani_Click);
            // 
            // btPotvrdi
            // 
            this.btPotvrdi.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.btPotvrdi.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btPotvrdi.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btPotvrdi.Location = new System.Drawing.Point(236, 316);
            this.btPotvrdi.Name = "btPotvrdi";
            this.btPotvrdi.Size = new System.Drawing.Size(159, 33);
            this.btPotvrdi.TabIndex = 7;
            this.btPotvrdi.Text = "Potvrdi";
            this.btPotvrdi.UseVisualStyleBackColor = false;
            this.btPotvrdi.Click += new System.EventHandler(this.btPotvrdi_Click);
            // 
            // lbRestoran
            // 
            this.lbRestoran.AutoSize = true;
            this.lbRestoran.Location = new System.Drawing.Point(12, 55);
            this.lbRestoran.Name = "lbRestoran";
            this.lbRestoran.Size = new System.Drawing.Size(61, 18);
            this.lbRestoran.TabIndex = 8;
            this.lbRestoran.Text = "label4";
            // 
            // lbSto
            // 
            this.lbSto.AutoSize = true;
            this.lbSto.Location = new System.Drawing.Point(364, 55);
            this.lbSto.Name = "lbSto";
            this.lbSto.Size = new System.Drawing.Size(0, 18);
            this.lbSto.TabIndex = 9;
            // 
            // maskedTextBox1
            // 
            this.maskedTextBox1.Location = new System.Drawing.Point(197, 204);
            this.maskedTextBox1.Mask = "(999) 000-0000";
            this.maskedTextBox1.Name = "maskedTextBox1";
            this.maskedTextBox1.Size = new System.Drawing.Size(148, 26);
            this.maskedTextBox1.TabIndex = 2;
            this.maskedTextBox1.TextMaskFormat = System.Windows.Forms.MaskFormat.ExcludePromptAndLiterals;
            this.maskedTextBox1.Enter += new System.EventHandler(this.dateTimePicker1_Enter);
            this.maskedTextBox1.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.maskedTextBox1_KeyPress);
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(68, 259);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(94, 18);
            this.label4.TabIndex = 10;
            this.label4.Text = "Sifra stola";
            this.label4.Visible = false;
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(197, 255);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(148, 26);
            this.comboBox1.TabIndex = 11;
            this.comboBox1.Visible = false;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // restoranDataSet
            // 
            this.restoranDataSet.DataSetName = "RestoranDataSet";
            this.restoranDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // stoBindingSource
            // 
            this.stoBindingSource.DataMember = "Sto";
            this.stoBindingSource.DataSource = this.restoranDataSet;
            // 
            // stoTableAdapter
            // 
            this.stoTableAdapter.ClearBeforeFill = true;
            // 
            // stoBindingSource1
            // 
            this.stoBindingSource1.DataMember = "Sto";
            this.stoBindingSource1.DataSource = this.restoranDataSet;
            // 
            // frmUnosRecepcionar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(11F, 18F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(425, 360);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.maskedTextBox1);
            this.Controls.Add(this.lbSto);
            this.Controls.Add(this.lbRestoran);
            this.Controls.Add(this.btPotvrdi);
            this.Controls.Add(this.btOdustani);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.tbIme);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dateTimePicker1);
            this.Font = new System.Drawing.Font("Lucida Fax", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(6, 4, 6, 4);
            this.Name = "frmUnosRecepcionar";
            this.Text = "frmUnosRecepcionar";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.frmUnosRecepcionar_FormClosing);
            this.Load += new System.EventHandler(this.frmUnosRecepcionar_Load);
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.restoranDataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.stoBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.stoBindingSource1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DateTimePicker dateTimePicker1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox tbIme;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btOdustani;
        private System.Windows.Forms.Button btPotvrdi;
        private System.Windows.Forms.Label lbRestoran;
        private System.Windows.Forms.Label lbSto;
        private System.Windows.Forms.MaskedTextBox maskedTextBox1;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.Label label4;
        private RestoranDataSet restoranDataSet;
        private System.Windows.Forms.BindingSource stoBindingSource;
        private RestoranDataSetTableAdapters.StoTableAdapter stoTableAdapter;
        private System.Windows.Forms.BindingSource stoBindingSource1;
    }
}