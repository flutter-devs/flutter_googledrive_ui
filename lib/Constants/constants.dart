import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_drive_proj/model/dropbox.dart';
import 'package:google_drive_proj/model/files_image.dart';
import 'package:google_drive_proj/model/folders.dart';
import 'package:google_drive_proj/model/lastfile_list.dart';

class Constants{

  static final String GOOGLE_DRIVE = 'GOOGLE_DRIVE';
  static final String SECOND_PAGE = 'SECOND_PAGE';

  static final String SPLASH_SCREEN = 'SPLASH_SCREEN';

  static List<DropBox>getDropBox(){
    return[
      new DropBox('assets/images/circle-cropped.png','DropBox'),
      new DropBox('assets/images/google-drive.png','Google Drive'),
    ];
  }
  
  static List<LastFile>getLastFile(){
    return[
      new LastFile('assets/images/xls.png','Claint Work','Dropbaox Project CLient Work','assets/images/white_threedot.png', false),
      new LastFile('assets/images/gallery_img_crop.png','1Claint Work','Dropbaox Project CLient Work','assets/images/white_threedot.png', false),
      new LastFile('assets/images/xls.png','Landing Page','Dropbaox Project CLient Work','assets/images/white_threedot.png', false),
      new LastFile('assets/images/xls.png','Landing Page','Dropbaox Project CLient Work','assets/images/white_threedot.png',false),
      new LastFile('assets/images/xls.png','Landing Page','Dropbaox Project CLient Work','assets/images/white_threedot.png',false),
      new LastFile('assets/images/xls.png','Landing Page','Dropbaox Project CLient Work','assets/images/white_threedot.png',false),
      new LastFile('assets/images/xls.png','Landing Page','Dropbaox Project CLient Work','assets/images/white_threedot.png',false),
    ];
  }


  static List<Folder>getFoldersFile(){
    return[
      new Folder('', 'My Drive','assets/images/mobile_app_hero.png','assets/images/Diampnd.jpeg'),
      new Folder('', 'My Drive','assets/images/mobile_app_hero.png','assets/images/image_file.jpg'),
    ];
  }

  static List<FileImageList>getFileListImage(){
    return[
     new FileImageList('assets/images/image_file.jpg'),
     new FileImageList('assets/images/diamond_img.jpeg'),
     new FileImageList('assets/images/mobile_app_hero.png'),
     new FileImageList('assets/images/diamond_img.jpeg'),


    ];
  }
}