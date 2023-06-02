using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace курсач_тц_новый
{
    /// <summary>
    /// Логика взаимодействия для Stada.xaml
    /// </summary>
    public partial class Stada : Window
    {
        public List<TblStat> TblStats { get; set; }
        public List<Stada> stadas;
        private TblStat SelectedStat { get; set; }
        public TblStat stat { get; set; }
        private TblStat Statred = new TblStat();


        public List<TblPavilion> tblPavilion;
        public TblPavilion SelectedPavilion { get; }
        public Stada(TblStat selectedStat, TblPavilion selectedPavilion)
        {
            InitializeComponent();
            Jop.ItemsSource = DB.GetInstance().TblStats.ToList();
            TblStats = DB.GetInstance().TblStats.ToList();
            //DataContext = new TblStat();
            DataContext = Statred;
            DataContext = SelectedStat;

            tblPavilion = DB.GetInstance().TblPavilions.ToList();
            SelectedPavilion = selectedPavilion;

            //SelectedStat = selectedStat;
            //stat = new TblStat();
            //stat = selectedStat;
            DataContext = this;
        }

        private void Sadd(object sender, RoutedEventArgs e)
        {
            
            
            new TblStat();
            TblStats = DB.GetInstance().TblStats.ToList();
            SelectedStat = new TblStat();//мб понадобится сделать SelectedStat.и_тут_типо_навигэйшенс
            DB.GetInstance().TblStats.Add(SelectedStat);
            DB.GetInstance().SaveChanges();
            Signal(nameof(TblStats));
        }

        private void Srem(object sender, RoutedEventArgs e)
        {

        }
        private void Sdel(object sender, RoutedEventArgs e)
        {
            var result = MessageBox.Show("Вы действительно хотите удалить эту запись?", "Подтвердить", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                var db = DB.GetInstance();
                db.TblStats.Remove(SelectedStat);
                SelectedStat = null;
                db.SaveChanges();
                Signal(nameof(TblStats));
            }
        }
        public event PropertyChangedEventHandler? PropertyChanged;
        void Signal(string prop) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));

       
    }
}
