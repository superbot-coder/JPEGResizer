{
  Old Resource from: 
  https://it-blackcat.blogspot.com/2020/06/change-image-resolution-acceleration.html
}

unit ahGraphicsHelpers;
 
interface
 
uses
  System.Classes, System.SysUtils, System.Math, 
  Vcl.Graphics, Vcl.Imaging.jpeg, WinAPI.Windows;
 
type
  TCanvasHelper = class helper for TCanvas
    function GetFHandle: HDC;
  end;
 
  TJPEGImageHelper = class helper for TJPEGImage
    procedure Resize(const NewWidth, NewHeight: Integer; 
                     const StretchMode: Integer = COLORONCOLOR);
  end;
 
implementation
 
{ TCanvasHelper }
 
function TCanvasHelper.GetFHandle: HDC;
begin
  with Self do
    begin
      if FHandle = 0 then
        RequiredState([csHandleValid..csBrushValid]);
      Result := FHandle;
    end;
end;
 
{ TJPEGImageHelper }
 
procedure TJPEGImageHelper.Resize(const NewWidth, NewHeight, StretchMode: Integer);
var
  bmp: Vcl.Graphics.TBitmap;
  fScale: Double;
  PrevPt: TPoint;
  hBMP, hJPG: HDC;
begin
  if (NewWidth <> Width) or (NewHeight <> Height) then
    begin
      fScale := Min(NewWidth / Width, NewHeight / Height);
      bmp := Vcl.Graphics.TBitmap.Create;
      try
        bmp.SetSize(Round(Width * fScale), Round(Height * fScale));
        hBMP := bmp.Canvas.GetFHandle;
        hJPG := Canvas.GetFHandle;
 
        GetBrushOrgEx(hBMP, PrevPt);
        SetStretchBltMode(hBMP, StretchMode);
        SetBrushOrgEx(hBMP, PrevPt.x, PrevPt.y, @PrevPt);
        StretchBlt(hBMP, 0, 0, bmp.Width, bmp.Height, hJPG, 0, 0, Width, Height, SRCCOPY);
        Assign(bmp);
      finally
        bmp.Free;
      end;
    end;
end;
 
end.