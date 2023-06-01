using System;
using System.Collections.Generic;

namespace курсач_тц_новый;

public partial class TblStat
{
    public int IdStat { get; set; }

    public int? StatProf { get; set; }

    public int? StatLoss { get; set; }

    public int? StatVis { get; set; }

    public DateOnly? StatData { get; set; }

    public int? StatCardId { get; set; }

    public virtual ICollection<TblCardhall> TblCardhalls { get; set; } = new List<TblCardhall>();
}
