using System;
using System.Collections.Generic;

namespace курсач_тц_новый;

public partial class TblCardhall
{
    public int IdCard { get; set; }

    public int? CardPav { get; set; }

    public int? CardHall { get; set; }

    public int? CardRoom { get; set; }

    public virtual TblHall? CardHallNavigation { get; set; } = null!;

    public virtual TblPavilion? CardPavNavigation { get; set; } = null!;

    public virtual TblRoom? CardRoomNavigation { get; set; } = null!;
}
