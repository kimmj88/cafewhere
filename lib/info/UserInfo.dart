// enum ImageType {
//   LOGO,
//   SLICE,
//   MENU,
// }

class UserInfo {
  int m_nUser_key;
  String m_strName;
  String m_strBirthday;
  String m_email;
  String m_strPassword;
  bool m_gender;
  //ImageType bImgaType;

  UserInfo(this.m_nUser_key, this.m_strName, this.m_email, this.m_strBirthday,
      this.m_strPassword, this.m_gender,
      {key});
}
