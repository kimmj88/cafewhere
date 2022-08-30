enum ImageType {
  LOGO,
  SLICE,
}

class SaveInfo {
  String strStoreKey;
  String strName;
  String strAddress;
  String strDesc;
  String strTag;
  ImageType bImgaType;

  SaveInfo(this.strStoreKey, this.strName, this.strAddress, this.strDesc,
      this.strTag, this.bImgaType,
      {key});
}
