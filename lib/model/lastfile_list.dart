class
LastFile{
  String _img;
  String _title;
  String _subTitle;
  String _iconImg;
  bool isProgressBar=false;

  LastFile(this._img,this._title,this._subTitle,this._iconImg, this.isProgressBar);

  String get img=>_img;
  String get title=>_title;
  String get subTitle=>_subTitle;
  String get iconImg=>_iconImg;
}