class AppRoute {
  static String splash = "/splash";
  static String onboarding = "/onboarding";
  static String landing = "/landing";

  // Auth
  static String login = "/login";

  // Auth - Register
  static String registerTipe = "/register/tipe-usaha";
  static String registerRekening = "/register/rekening"; // 1
  static String registerPhone = "/register/phone"; // 2
  static String registerPhonePin = "/register/phone/pin"; // 2
  static String registerEmail = "/register/email"; // 2
  static String registerPassword = "/register/password"; // 3
  static String registerPasswordConfirm = "/register/password-confirm"; // 3

  static String registerUsaha = "/register/usaha"; // 4
  static String registerEo = "/register/eo"; // 4
  static String registerEoConfirm = "/register/eo/confirm"; // 4

  static String registerSuccess = "/register/success";

  static String home = "/home";

  // Talangan
  static String loanOnboard = "/onboard-loan";
  static String loanSk = "/onboard-loan/sk";
  static String loanDoccument = "/onboard-loan/doccument";
  static String loanFinish = "/onboard-loan/finish";
  static String loanBanding = "/onboard-loan/banding";

  static String talangan = "/talangan";
  static String loan = "/talangan/loan";
  static String loanInstallment = "/talangan/loan/installment";
  static String loanSummary = "/talangan/loan/summary";
  static String loanApproved = "/talangan/loan/approved";

  static String creditScore = "/talangan/credit-score";

  static String loanDetail(String id) => "/talangan/credit-score/loan/$id";
  static String loanRepayment(String id) =>
      "/talangan/credit-score/loan/$id/repayment";
  static String repaymentSuccess(String id) =>
      "/talangan/credit-score/loan/$id/repayment-success";

  static String financialTips = "/talangan/financial-tips";

  //  Cashflow
  static String cashflow = "/cashflow";

  // Outlet
  static String setting = "/setting";
  static String outlet = "/outlet";
  static String createOutlet = "/outlet/new";
  static String outletDetail(String id) => "/outlet/$id";
  static String editOutlet(String id) => "/outlet/$id/edit";
  static String outletCreated = "/outlet/creted";
  static String outletDeleted = "/outlet/deleted";

  // SMEs SIDE ====== EVENT
  static String eventSearch = "/event/search";
  static String eventDetail(String id) => "/event/detail/$id";
  static String eventRegistered = "/event/registered";
  static String eventInvoice(String id) => "/event/detail/$id/invoice";
  static String eventPayment(String id) => "/event/detail/$id/payment";
  static String eventSuccess = "/event/registered-success";
}
