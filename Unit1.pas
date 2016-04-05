unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, ValEdit, Func, RXgif;

type
  TfmMark = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    i1: TImage;
    i2: TImage;
    i4: TImage;
    i3: TImage;
    i5: TImage;
    i6: TImage;
    vl: TValueListEditor;
    label111: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    RadioGroup1: TRadioGroup;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    p1: TPanel;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton52: TRadioButton;
    RadioButton58: TRadioButton;
    RadioButton59: TRadioButton;
    p2: TPanel;
    RadioButton12: TRadioButton;
    RadioButton13: TRadioButton;
    RadioButton14: TRadioButton;
    RadioButton15: TRadioButton;
    RadioButton16: TRadioButton;
    RadioButton17: TRadioButton;
    RadioButton18: TRadioButton;
    RadioButton19: TRadioButton;
    RadioButton20: TRadioButton;
    RadioButton21: TRadioButton;
    p3: TPanel;
    RadioButton24: TRadioButton;
    RadioButton25: TRadioButton;
    RadioButton26: TRadioButton;
    RadioButton27: TRadioButton;
    RadioButton28: TRadioButton;
    RadioButton29: TRadioButton;
    RadioButton30: TRadioButton;
    RadioButton31: TRadioButton;
    RadioButton32: TRadioButton;
    RadioButton33: TRadioButton;
    p4: TPanel;
    RadioButton34: TRadioButton;
    RadioButton35: TRadioButton;
    RadioButton36: TRadioButton;
    RadioButton37: TRadioButton;
    RadioButton38: TRadioButton;
    RadioButton39: TRadioButton;
    RadioButton40: TRadioButton;
    RadioButton41: TRadioButton;
    RadioButton42: TRadioButton;
    RadioButton43: TRadioButton;
    RadioButton44: TRadioButton;
    RadioButton45: TRadioButton;
    p5: TPanel;
    RadioButton46: TRadioButton;
    RadioButton47: TRadioButton;
    RadioButton49: TRadioButton;
    RadioButton50: TRadioButton;
    RadioButton54: TRadioButton;
    RadioButton55: TRadioButton;
    RadioButton56: TRadioButton;
    RadioButton57: TRadioButton;
    p6: TPanel;
    RadioButton64: TRadioButton;
    RadioButton65: TRadioButton;
    RadioButton66: TRadioButton;
    RadioButton67: TRadioButton;
    RadioButton69: TRadioButton;
    RadioButton70: TRadioButton;
    RadioButton72: TRadioButton;
    Button1: TButton;
    cb: TCheckBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure vlKeyPress(Sender: TObject; var Key: Char);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function Marker:Integer;
    procedure Clears;
    procedure Formula3;
    procedure Formula4;
    procedure Formula5;
    procedure Formula6;
  public
    { Public declarations }
  end;

const
//резистор
 //множитель
 mnozh:array[-2..9] of Extended=(0.01,0.1, 1,10 ,100,1000,10000,100000,1000000,10000000,100000000,1000000000);
 //допуск
 toch: array[-2..9] of Extended=(10,5,-1,1,2,-1,-1,0.5,0.25,0.1,0.05,-1);
 //температурный коеффицент
 tkc:  array[-2..9] of Integer= (-1,-1,-1,100,50, 15,  25,   -1,10, 5,-1,1);
 //pro:  array[-2..9] of Extended=(-1,-1,-1,1  ,0.1,0.01,0.001,-1,-1,-1,-1,-1);

//дросель
 mnozh_d:array[-2..9] of Extended=(0.01,0.1, 1,10 ,100,1000,10000,100000,1000000,10000000,100000000,1000000000);
 toch_d: array[-2..9] of Extended=(10,5,-1,1,2,-1,-1,0.5,0.25,0.1,0.05,-1);
 tkc_d:  array[-2..9] of Integer= (-1,-1,-1,100,50, 15,  25,   -1,10, 5,-1,1);

 fl:array[-2..9] of string=('Silver.gif','Gold.gif','Black.gif','Brown.gif','Red.gif','Orange.gif','Yellow.gif','Green.gif',
                            'Blue.gif','Violet.gif','Gray.gif','White.gif');

var
  fmMark: TfmMark;
  vlb:Boolean;
  a:array[0..5] of integer;

implementation

{$R *.dfm}

procedure TfmMark.FormCreate(Sender: TObject);
begin
 Label2.Color:=RGB(255,215,0);   //золотой
 Label4.Color:=RGB(128,64,0);    //коричневый
 Label6.Color:=RGB(255,128,0); //оранжевый
 Label10.Color:=RGB(128,0,128); //фиолетовый
 RadioGroup1.ItemIndex:=0;
end;

function TfmMark.Marker:Integer;
var
 i,m:integer;
begin
 m:=0;
{ for i:=0 to ComponentCount-1 do begin
  if Components[i] is TComboBox then
   if (Components[i] as TComboBox).ItemIndex<>12 then inc(m);
 end; //for
 Result:=m;
 cb.Enabled:=m=6;}
 for i:=0 to 5 do a[i]:=-1;
 for i:=0 to fmMark.p1.ControlCount-1 do
  if (fmMark.p1.Controls[i] as TRadioButton).Checked=True then begin
   inc(m);
   a[0]:=StrToInt((fmMark.p1.Controls[i] as TRadioButton).Hint);
   Break;
  end;
 for i:=0 to fmMark.p2.ControlCount-1 do
  if (fmMark.p2.Controls[i] as TRadioButton).Checked=True then begin
   inc(m);
   a[1]:=StrToInt((fmMark.p2.Controls[i] as TRadioButton).Hint);
   Break;
  end;
 for i:=0 to fmMark.p3.ControlCount-1 do
  if (fmMark.p3.Controls[i] as TRadioButton).Checked=True then begin
   inc(m);
   a[2]:=StrToInt((fmMark.p3.Controls[i] as TRadioButton).Hint);
   Break;
  end;
 for i:=0 to fmMark.p4.ControlCount-1 do
  if (fmMark.p4.Controls[i] as TRadioButton).Checked=True then begin
   inc(m);
   a[3]:=StrToInt((fmMark.p4.Controls[i] as TRadioButton).Hint);
   Break;
  end;
 for i:=0 to fmMark.p5.ControlCount-1 do
  if (fmMark.p5.Controls[i] as TRadioButton).Checked=True then begin
   inc(m);
   a[4]:=StrToInt((fmMark.p5.Controls[i] as TRadioButton).Hint);
   Break;
  end;
 for i:=0 to fmMark.p6.ControlCount-1 do
  if (fmMark.p6.Controls[i] as TRadioButton).Checked=True then begin
   inc(m);
   a[5]:=StrToInt((fmMark.p6.Controls[i] as TRadioButton).Hint);
   Break;
  end;
 Result:=m;
end;

function MakeSize(Size: Extended): String;
const
 k=1000;
 m=k*k;
 g=m*k;
BEGIN
 Result:='';
 //ShowMessage(IntToStr(Size));
 if (Size>=0) and (Size<=k-1) then
  Result:=FloatToStr(size)+' Ом'
 else if (Size>=k) and (Size<=m-1) then
  Result:=Format('%.2n КОм',[Size/k])
 else if (Size>=m) and (Size<=g-1) then
  Result:=Format('%.2n МОм',[Size/m])
 else Result:=Format('%.2n ГОм',[Size/g]);
END; //function MakeMemSize

procedure TfmMark.Clears;
var
 i:integer;
begin
// for i:=0 to 5 do a[i]:=0;
 vl.Values['Сопротивление']:='';
 vl.Values['Допуск']:='5';
 vl.Values['Температурный коэффицент']:='';
// vl.Values['Надежность отказов']:='';
 label111.Caption:='Пример';
end;

procedure TfmMark.Formula3;
var
 i,y{,f}:integer;
 s:Extended;
begin
 Clears;
 vl.Values['Допуск']:='20';
 s:=(a[0]*10+a[1])*mnozh[a[3]];
 vl.Values['Сопротивление']:=FloatToStr(s);
 label111.Caption:=MakeSize(s)+', +/-'+vl.Values['Допуск']+'%';
end;

procedure TfmMark.Formula4;
var
 i,y:integer;
 s:Extended;
begin
 Clears;
 vl.Values['Допуск']:=FloatToStr(toch[a[4]]);
 s:=(a[0]*10+a[1])*mnozh[a[3]];
 vl.Values['Сопротивление']:=FloatToStr(s);
 label111.Caption:=MakeSize(s)+', +/-'+vl.Values['Допуск']+'%';
end;

procedure TfmMark.Formula5;
var
 i,y:integer;
 s:Extended;
begin
 Clears;
 vl.Values['Допуск']:=FloatToStr(toch[a[4]]);
 s:=((a[0]*100)+(a[1]*10)+a[2])*mnozh[a[3]];
 vl.Values['Сопротивление']:=FloatToStr(s);
 label111.Caption:=MakeSize(s)+', +/-'+vl.Values['Допуск']+'%';
end;

procedure TfmMark.Formula6;
var
 i,y:integer;
 s:Extended;
begin
 Clears;
 vl.Values['Допуск']:=FloatToStr(toch[a[4]]);
// if not cb.Checked then begin
 vl.Values['Температурный коэффицент']:=FloatToStr(tkc[a[5]]);
// vl.Values['Надежность отказов']:=FloatToStr(pro[a[5]])+'%';
// end else begin
//  vl.Values['Температурный коэффицент']:='';
//  vl.Values['Надежность отказов']:=FloatToStr(pro[a[5]])+'%';
// end; //if
 s:=((a[0]*100)+(a[1]*10)+a[2])*mnozh[a[3]];
 vl.Values['Сопротивление']:=FloatToStr(s);
 label111.Caption:=MakeSize(s)+', +/-'+vl.Values['Допуск']+'%, '+vl.Values['Температурный коэффицент']+'°C';
end;

procedure TfmMark.vlKeyPress(Sender: TObject; var Key: Char);
var
 s,t:string;
 i,j,k,m:integer;
 tmp,tmp2,tmp3:Double;
begin
 if Key=#13 then begin
  tmp:=0; tmp2:=0; tmp3:=0;
  vlb:=true;
  s:=vl.Values['Сопротивление'];
  m:=StrToInt(vl.Values['Полос маркировки']);
  if not (m in [3..6]) then begin
   ShowMessage('укажите количество маркировочных полос');
   Exit;
  end;
  RadioGroup1.ItemIndex:=m-3;
  if TryStrToFloat(s,tmp2) then begin
   //k:=Length(s)-2;
   if m>3 then begin
    t:=StringReplace(vl.Values['Допуск'],',','.',[rfReplaceAll]);
    if trim(t)='' then t:='10';
    //высчитываем допуск
    for i:=-2 to 9 do
     if toch[i]=StrToFloat(t) then begin
      for j:=0 to p5.ControlCount-1 do
       if StrToInt((p5.Controls[j] as TRadioButton).Hint)=i then begin
        (p5.Controls[j] as TRadioButton).Checked:=True;
        Break;
       end; //if
      Break;
     end; //if
   end; //if m>4
   //выделяем из набора цифр главные показатели (1, 2 и 3 составляющие)
   if tmp2<1 then begin
    if m>=5 then tmp:=tmp2*1000 else tmp:=tmp2*100;
   end else if tmp2<10 then begin
    if m>=5 then tmp:=tmp2*100 else tmp:=tmp2*10;
   end else if tmp2<=99.9 then begin
    if m>=5 then tmp:=tmp2*10 else tmp:=tmp2;
   end else begin
    tmp:=StrToInt(StringReplace(FloatToStr(tmp2),'0','',[rfReplaceAll]));
    if m<=4 then begin
     if Length(FloatToStr(tmp))=1 then tmp:=tmp*10
    end else if m>=5 then
     if Length(FloatToStr(tmp))=2 then tmp:=tmp*10
      else if Length(FloatToStr(tmp))=1 then tmp:=tmp*100
    else
   end;
   s:=FloatToStr(tmp);
   //можитель
   tmp3:=tmp2/tmp;
   for j:=0 to p4.ControlCount-1 do begin
    i:=StrToInt((p4.Controls[j] as TRadioButton).Hint);
    //tmp:=(StrToInt(s[1])*10)*mnozh[i] + StrToInt(s[2])*mnozh[i];
    if FloatToStr(tmp3)=FloatToStr(mnozh[i]) then begin
     (p4.Controls[j] as TRadioButton).Checked:=True;
     Break;
    end; //if
   end; //for
   //первое число
    for j:=0 to p1.ControlCount-1 do
     if (p1.Controls[j] as TRadioButton).Hint=s[1] then begin
      (p1.Controls[j] as TRadioButton).Checked:=True;
      Break;
     end; //if
   //второе число
    for j:=0 to p2.ControlCount-1 do
     if (p2.Controls[j] as TRadioButton).Hint=s[2] then begin
      (p2.Controls[j] as TRadioButton).Checked:=True;
      Break;
     end; //if
   if m=5 then
   //третье число
    for j:=0 to p3.ControlCount-1 do
     if (p3.Controls[j] as TRadioButton).Hint=s[3] then begin
      (p3.Controls[j] as TRadioButton).Checked:=True;
      Break;
     end; //if
   if m=6 then begin
    //температура
    if trim(vl.Values['Температурный коэффицент'])='' then k:=50
     else k:=StrToInt(vl.Values['Температурный коэффицент']);
     for j:=0 to p6.ControlCount-1 do
      if (p6.Controls[j] as TRadioButton).Hint=IntToStr(k) then begin
       (p6.Controls[j] as TRadioButton).Checked:=True;
       Break;
      end; //if

   end; //if
  end;
  vlb:=false;
  RadioButton4Click(Sender);
  m:=StrToInt(vl.Values['Полос маркировки']);
  RadioGroup1.ItemIndex:=m-3;
  i1.Picture.LoadFromFile(ExeP+'resistor/'+fl[a[0]]);
  i2.Picture.LoadFromFile(ExeP+'resistor/'+fl[a[1]]);
  if m>=5 then i3.Picture.LoadFromFile(ExeP+'resistor/'+fl[a[2]])
   else i3.Picture.LoadFromFile(ExeP+'resistor/None.gif');
  i4.Picture.LoadFromFile(ExeP+'resistor/'+fl[a[3]]);
  if m>3 then i5.Picture.LoadFromFile(ExeP+'resistor/'+fl[a[4]])
   else i5.Picture.LoadFromFile(ExeP+'resistor/None.gif');;
  if m=6 then i6.Picture.LoadFromFile(ExeP+'resistor/'+fl[a[5]])
   else i6.Picture.LoadFromFile(ExeP+'resistor/None.gif');;
 end; //if key
end;

procedure TfmMark.RadioButton4Click(Sender: TObject);
var
 t,i,m:integer;
begin
 if vlb then Exit;
 if Sender is TRadioButton then begin
  t:=(Sender as TRadioButton).Tag;
  i:=StrToInt((Sender as TRadioButton).Hint);
  case t of
   1:i1.Picture.LoadFromFile(ExeP+'resistor/'+fl[i]);
   2:i2.Picture.LoadFromFile(ExeP+'resistor/'+fl[i]);
   3:i3.Picture.LoadFromFile(ExeP+'resistor/'+fl[i]);
   4:i4.Picture.LoadFromFile(ExeP+'resistor/'+fl[i]);
   5:i5.Picture.LoadFromFile(ExeP+'resistor/'+fl[i]);
   6:i6.Picture.LoadFromFile(ExeP+'resistor/'+fl[i]);
  end; //case t
 end; //if
 //выполняется независимо от того кем вызвана процедура
 m:=Marker;
 vl.Values['Полос маркировки']:=IntToStr(m);
 case m of
  3:Formula3;
  4:Formula4;
  5:Formula5;
  6:Formula6;
 end; //case
end;

procedure TfmMark.RadioGroup1Click(Sender: TObject);
var
 i:integer;
begin
 l3.Visible:=false; p3.Visible:=false;
 l5.Visible:=false; p5.Visible:=false;
 l6.Visible:=false; p6.Visible:=false;
 i:=RadioGroup1.ItemIndex+3;
 case i of
   3:begin
      l3.Enabled:=false; p3.Enabled:=false;
      l5.Enabled:=false; p5.Enabled:=false;
      l6.Enabled:=false; p6.Enabled:=false;
      for i:=0 to p3.ControlCount-1 do
       (p3.Controls[i] as TRadioButton).Checked:=False;
      for i:=0 to p5.ControlCount-1 do
       (p5.Controls[i] as TRadioButton).Checked:=False;
      for i:=0 to p6.ControlCount-1 do
       (p6.Controls[i] as TRadioButton).Checked:=False;
      i3.Picture.LoadFromFile(ExeP+'resistor/None.gif');
      i5.Picture.LoadFromFile(ExeP+'resistor/None.gif');
      i6.Picture.LoadFromFile(ExeP+'resistor/None.gif');
     end;
   4:begin
      l3.Enabled:=false; p3.Enabled:=false;
      l5.Enabled:=true; p5.Enabled:=true;
      l5.Visible:=true; p5.Visible:=true;
      l6.Enabled:=false; p6.Enabled:=false;
      for i:=0 to p3.ControlCount-1 do
       (p3.Controls[i] as TRadioButton).Checked:=False;
      for i:=0 to p6.ControlCount-1 do
       (p6.Controls[i] as TRadioButton).Checked:=False;
      i3.Picture.LoadFromFile(ExeP+'resistor/None.gif');
      i6.Picture.LoadFromFile(ExeP+'resistor/None.gif');
     end;
   5:begin
      l3.Enabled:=true; p3.Enabled:=true;
      l3.Visible:=true; p3.Visible:=true;
      l5.Enabled:=true; p5.Enabled:=true;
      l5.Visible:=true; p5.Visible:=true;
      l6.Enabled:=false; p6.Enabled:=false;
      for i:=0 to p6.ControlCount-1 do
       (p6.Controls[i] as TRadioButton).Checked:=False;
      i6.Picture.LoadFromFile(ExeP+'resistor/None.gif');
     end;
   6:begin
      l3.Enabled:=true; p3.Enabled:=true;
      l3.Visible:=true; p3.Visible:=true;
      l5.Enabled:=true; p5.Enabled:=true;
      l5.Visible:=true; p5.Visible:=true;
      l6.Enabled:=true; p6.Enabled:=true;
      l6.Visible:=true; p6.Visible:=true;
     end;
 end; //case
end;

procedure TfmMark.Button1Click(Sender: TObject);
var
 i:integer;
begin
 i1.Picture.LoadFromFile(ExeP+'resistor/None.gif');
 i2.Picture.LoadFromFile(ExeP+'resistor/None.gif');
 i3.Picture.LoadFromFile(ExeP+'resistor/None.gif');
 i4.Picture.LoadFromFile(ExeP+'resistor/None.gif');
 i5.Picture.LoadFromFile(ExeP+'resistor/None.gif');
 i6.Picture.LoadFromFile(ExeP+'resistor/None.gif');
 for i:=0 to p1.ControlCount-1 do
   (p1.Controls[i] as TRadioButton).Checked:=False;
 for i:=0 to p2.ControlCount-1 do
   (p2.Controls[i] as TRadioButton).Checked:=False;
 for i:=0 to p3.ControlCount-1 do
   (p3.Controls[i] as TRadioButton).Checked:=False;
 for i:=0 to p4.ControlCount-1 do
   (p4.Controls[i] as TRadioButton).Checked:=False;
 for i:=0 to p5.ControlCount-1 do
   (p5.Controls[i] as TRadioButton).Checked:=False;
 for i:=0 to p6.ControlCount-1 do
   (p6.Controls[i] as TRadioButton).Checked:=False;
end;

end.
