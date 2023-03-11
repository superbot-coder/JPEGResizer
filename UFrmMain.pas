unit UFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Jpeg, acPNG,
  System.ImageList, Vcl.ImgList, System.Math, Vcl.Samples.Spin, Vcl.ComCtrls;

Type TScaleMode = (scaleNone, scaleInto);

type
  TFrmMain = class(TForm)
    BtnOpen: TButton;
    BtnResize: TButton;
    OpenDlg: TOpenDialog;
    ImageInput: TImage;
    ImageResizeble: TImage;
    LblFileInput: TLabel;
    LblFileOutput: TLabel;
    lblFiSize: TLabel;
    LblFoSize: TLabel;
    PnlImage: TPanel;
    ImagePreView: TImage;
    PnlSourceImage: TPanel;
    PnlDestImage: TPanel;
    SpEditNewWidth: TSpinEdit;
    SpEditNewHeight: TSpinEdit;
    LblNewWidth: TLabel;
    LblNewHeight: TLabel;
    LblPreView: TLabel;
    lblPreviewText: TLabel;
    TrackBarCompressionQuality: TTrackBar;
    LblQuality: TLabel;
    TrackBarPreview: TTrackBar;
    LblPreViewQuality: TLabel;
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnResizeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrackBarCompressionQualityChange(Sender: TObject);
    procedure TrackBarPreviewChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure JpegResize(jpg: TJpegImage; NewWidth, NewHeight: integer; Mode: TScaleMode);
  end;

var
  FrmMain: TFrmMain;
  FileInput  : string;
  FileOutput : string;
  FilePreview: string;
  jpg: TJPEGImage;

implementation

{$R *.dfm}

procedure TFrmMain.BtnOpenClick(Sender: TObject);
begin
  if not OpenDlg.Execute then Exit;
  FileInput := OpenDlg.FileName;
  ImageInput.Picture.LoadFromFile(OpenDlg.FileName);
  FileOutput  := ChangeFileext(FileInput, '_resizeble.JPG');
  FilePreview := ChangeFileext(FileInput, '_preview.JPG');
  LblFileInput.Caption  := 'File Input: ' + OpenDlg.FileName;
  LblFileOutput.Caption := 'FileInput: ' + FileInput;
  LblFileOutput.Caption := FileOutput;
  jpg.LoadFromFile(OpenDlg.FileName);
  ImageInput.Picture.Assign(jpg);
  lblFiSize.Caption := 'Inpit file size: ' + IntToStr(jpg.Width) + 'x' + IntToStr(jpg.Height);
end;

procedure TFrmMain.BtnResizeClick(Sender: TObject);
begin
  if (jpg.Width = 0) or (jpg.Height = 0) then
  begin
    ShowMessage('Image not loaded from file');
    exit;
  end;
  JpegResize(jpg, SpEditNewWidth.Value, SpEditNewHeight.Value, scaleInto);
  jpg.CompressionQuality := TrackBarCompressionQuality.Position;
  jpg.compress;
  ImageResizeble.Picture.Assign(jpg);
  LblFoSize.Caption := 'Output file size: ' + IntToStr(jpg.Width) + 'x' +IntToStr(jpg.Height);
  jpg.SaveToFile(FileOutput);
  // load number two
  jpg.Assign(ImageInput.Picture.Graphic);
  JpegResize(jpg, 240, 135, scaleInto);
  jpg.CompressionQuality := TrackBarPreview.Position;
  jpg.compress;
  ImagePreView.Picture.Assign(jpg);
  LblPreView.Caption := 'Preview size: ' + IntToStr(jpg.Width) + 'x' + IntToStr(jpg.Height);
  jpg.SaveToFile(FilePreview);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  ImagePreView.Align    := alClient;
  ImageInput.Align      := alClient;
  ImageResizeble.Align  := alClient;
  jpg := TJPEGImage.Create;
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
  jpg.Free;
end;

procedure TFrmMain.JpegResize(jpg: TJpegImage; NewWidth, NewHeight: integer;
  Mode: TScaleMode);
var
  bmp    : TBItmap;
  Scale  : Double;
  PrevPt : TPoint;
begin
  if (NewWidth = jpg.Width) or (NewHeight = jpg.Height) then exit;
  bmp := Tbitmap.Create;
  try

   {case Mode of
      scaleNone: bmp.SetSize(NewWidth, NewHeight);
      scaleInto:
        begin
          Scale := jpg.Width / jpg.Height;
          bmp.Width  := NewWidth;
          bmp.Height := Round(NewWidth * Scale);
          if bmp.Height > NewHeight then
          begin
            bmp.Height := NewHeight;
            bmp.Width  := Round(NewHeight * Scale);
          end;
        end;
    end; }

    case Mode of
      scaleNone: bmp.SetSize(NewWidth, NewHeight);
      scaleInto:
        begin
          Scale := Min(NewWidth / jpg.Width, NewHeight / jpg.Height);
          bmp.SetSize(Round(jpg.Width * Scale), Round(jpg.Height * Scale));
        end;
    end;

    bmp.PixelFormat := pf24bit;
    SetStretchBltMode(bmp.canvas.handle, 4);
    SetBrushOrgEx(bmp.canvas.handle, PrevPt.X, PrevPt.Y, @PrevPt);
    StretchBlt(bmp.canvas.handle, 0, 0, bmp.Width, bmp.Height, jpg.canvas.handle, 0, 0, jpg.width, jpg.height, SRCCOPY);

    jpg.PixelFormat := jf24Bit;
    jpg.Performance := jpBestQuality;
    jpg.assign(bmp);

  finally
    bmp.Free;
  end;
end;

procedure TFrmMain.TrackBarCompressionQualityChange(Sender: TObject);
begin
  LblQuality.Caption := 'Compression Quality: ' +
                         IntToStr(TrackBarCompressionQuality.Position) + '%';
end;

procedure TFrmMain.TrackBarPreviewChange(Sender: TObject);
begin
  LblPreViewQuality.Caption := 'Comression quality preview: ' +
                               IntToStr(TrackBarPreview.Position) + '%';
end;

end.
