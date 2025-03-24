enum UserVariant { sme, eo }

class Global {
  static UserVariant type = UserVariant.sme;
  static bool isInsight = false;

  static bool isSme() {
    return Global.type == UserVariant.sme;
  }

  static void setUser(String type) {
    if (type == "sme") {
      Global.type = UserVariant.sme;
    } else {
      Global.type = UserVariant.eo;
    }
  }
}
