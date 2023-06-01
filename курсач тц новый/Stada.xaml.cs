using System;
using System.Collections.Generic;
using System.Linq;
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

        public Stada(TblStat selectedStat )
        {
            InitializeComponent();

            TblStats = DB.GetInstance().TblStats.ToList();
            DataContext = this;

            SelectedStat = selectedStat;
            stat = new TblStat();
            stat = selectedStat;
        }

        //public TblStat SelectedStat { get; }

        private void savedatach(object sender, RoutedEventArgs e)
        {
            DB.GetInstance().SaveChanges();
        }
    }
}
