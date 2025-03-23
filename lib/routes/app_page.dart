import 'package:flutter_portal/flutter_portal.dart';
import 'package:get/get.dart';
import 'package:mobile/app/bindings/auth_bindings.dart';
import 'package:mobile/app/bindings/cashflow_bindings.dart';
import 'package:mobile/app/bindings/credit_score_bindings.dart';
import 'package:mobile/app/bindings/eo_event_bindings.dart';
import 'package:mobile/app/bindings/eo_home_bindings.dart';
import 'package:mobile/app/bindings/eo_tenants_bindings.dart';
import 'package:mobile/app/bindings/home_bindings.dart';
import 'package:mobile/app/bindings/loan_bindings.dart';
import 'package:mobile/app/bindings/loan_onboard_binding.dart';
import 'package:mobile/app/bindings/outlet_bindings.dart';
import 'package:mobile/app/bindings/sme_event_bindings.dart';
import 'package:mobile/app/bindings/talangan_bindings.dart';
import 'package:mobile/app/presentation/view/cashflow_page.dart';
import 'package:mobile/app/presentation/view/create_outlet_page.dart';
import 'package:mobile/app/presentation/view/credit_score_page.dart';
import 'package:mobile/app/presentation/view/detail_outlet_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_available_tenants_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_create_event_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_detail_event_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_event_draft_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_event_map_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_event_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_event_publish_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_home_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_registered_tenants_page.dart';
import 'package:mobile/app/presentation/view/eo/eo_setting_page.dart';
import 'package:mobile/app/presentation/view/financial_tips_page.dart';
import 'package:mobile/app/presentation/view/home_page.dart';
import 'package:mobile/app/presentation/view/landing_page.dart';
import 'package:mobile/app/presentation/view/loan_approved_page.dart';
import 'package:mobile/app/presentation/view/loan_banding_page.dart';
import 'package:mobile/app/presentation/view/loan_detail_page.dart';
import 'package:mobile/app/presentation/view/loan_document_page.dart';
import 'package:mobile/app/presentation/view/loan_finish_page.dart';
import 'package:mobile/app/presentation/view/loan_installment_page.dart';
import 'package:mobile/app/presentation/view/loan_onboard_page.dart';
import 'package:mobile/app/presentation/view/loan_page.dart';
import 'package:mobile/app/presentation/view/loan_repayment_page.dart';
import 'package:mobile/app/presentation/view/loan_sk_page.dart';
import 'package:mobile/app/presentation/view/loan_summary_page.dart';
import 'package:mobile/app/presentation/view/login_page.dart';
import 'package:mobile/app/presentation/view/outlet_page.dart';
import 'package:mobile/app/presentation/view/register_email_page.dart';
import 'package:mobile/app/presentation/view/register_eo_confirm_page.dart';
import 'package:mobile/app/presentation/view/register_eo_page.dart';
import 'package:mobile/app/presentation/view/register_eo_success_page.dart';
import 'package:mobile/app/presentation/view/register_password_confirm_page.dart';
import 'package:mobile/app/presentation/view/register_password_page.dart';
import 'package:mobile/app/presentation/view/register_phone_page.dart';
import 'package:mobile/app/presentation/view/register_phone_pin_page.dart';
import 'package:mobile/app/presentation/view/register_rekening_page.dart';
import 'package:mobile/app/presentation/view/register_success_page.dart';
import 'package:mobile/app/presentation/view/register_tipe_page.dart';
import 'package:mobile/app/presentation/view/register_usaha_page.dart';
import 'package:mobile/app/presentation/view/repayment_success_page.dart';
import 'package:mobile/app/presentation/view/setting_page.dart';
import 'package:mobile/app/presentation/view/sme/sme_detail_event_page.dart';
import 'package:mobile/app/presentation/view/sme/sme_event_invoice_page.dart';
import 'package:mobile/app/presentation/view/sme/sme_event_payment_page.dart';
import 'package:mobile/app/presentation/view/sme/sme_event_registered_page.dart';
import 'package:mobile/app/presentation/view/sme/sme_event_search_page.dart';
import 'package:mobile/app/presentation/view/sme/sme_event_success_page.dart';
import 'package:mobile/app/presentation/view/splash_page.dart';
import 'package:mobile/app/presentation/view/talangan_page.dart';
import 'package:mobile/routes/app_route.dart';

List<GetPage<dynamic>> appPage() {
  return <GetPage<dynamic>>[
    GetPage(
      name: AppRoute.splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoute.landing,
      page: () => LandingPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.registerTipe,
      page: () => RegisterTipePage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.registerRekening,
      page: () => RegisterRekeningPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.registerPhone,
      page: () => RegisterPhonePage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoute.registerPhonePin,
      page: () => RegisterPhonePinPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoute.registerPassword,
      page: () => RegisterPasswordPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoute.registerPasswordConfirm,
      page: () => RegisterPasswordConfirmPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoute.registerUsaha,
      page: () => RegisterUsahaPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoute.registerEo,
      page: () => RegisterEoPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoute.registerEoConfirm,
      page: () => RegisterEoConfirmPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppRoute.talangan,
      page: () => TalanganPage(),
      binding: TalanganBindings(),
    ),
    GetPage(
      name: AppRoute.loan,
      page: () => LoanPage(),
      binding: LoanBindings(),
    ),
    GetPage(
      name: AppRoute.loanInstallment,
      page: () => LoanInstallmentPage(),
      binding: LoanBindings(),
    ),
    GetPage(
      name: AppRoute.loanSummary,
      page: () => LoanSummaryPage(),
      binding: LoanBindings(),
    ),
    GetPage(
      name: AppRoute.loanApproved,
      page: () => LoanApprovedPage(),
      binding: LoanBindings(),
    ),
    GetPage(
      name: AppRoute.creditScore,
      page: () => CreditScorePage(),
      binding: CreditScoreBindings(),
    ),
    GetPage(
      name: AppRoute.financialTips,
      page: () => FinancialTipsPage(),
      binding: LoanBindings(),
    ),
    GetPage(
      name: AppRoute.registerEmail,
      page: () => RegisterEmailPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.registerSuccess,
      page: () => RegisterSuccessPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.registerEoSuccess,
      page: () => RegisterEoSuccessPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.login,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoute.cashflow,
      page: () => CashflowPage(),
      binding: CashflowBindings(),
    ),
    GetPage(
      name: AppRoute.loanOnboard,
      page: () => LoanOnboardPage(),
      binding: LoanOnboardBinding(),
    ),
    GetPage(
      name: AppRoute.loanSk,
      page: () => LoanSkPage(),
      binding: LoanOnboardBinding(),
    ),
    GetPage(
      name: AppRoute.loanDoccument,
      page: () => Portal(
        child: LoanDocumentPage(),
      ),
      binding: LoanOnboardBinding(),
    ),
    GetPage(
      name: AppRoute.loanFinish,
      page: () => LoanFinishPage(),
      binding: LoanOnboardBinding(),
    ),
    GetPage(
      name: AppRoute.loanBanding,
      page: () => LoanBandingPage(),
      binding: LoanOnboardBinding(),
    ),
    GetPage(
      name: AppRoute.setting,
      page: () => SettingPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoute.outlet,
      page: () => OutletPage(),
      binding: OutletBindings(),
    ),
    GetPage(
      name: AppRoute.createOutlet,
      page: () => CreateOutletPage(edit: false),
      binding: OutletBindings(),
    ),
    GetPage(
      name: AppRoute.outletDetail(":id"),
      page: () => DetailOutletPage(),
      binding: OutletBindings(),
    ),
    GetPage(
      name: AppRoute.editOutlet(":id"),
      page: () => CreateOutletPage(edit: true),
      binding: OutletBindings(),
    ),
    GetPage(
      name: AppRoute.loanDetail(":id"),
      page: () => LoanDetailPage(),
      binding: CreditScoreBindings(),
    ),
    GetPage(
      name: AppRoute.loanRepayment(":id"),
      page: () => LoanRepaymentPage(),
      binding: CreditScoreBindings(),
    ),
    GetPage(
      name: AppRoute.repaymentSuccess(":id"),
      page: () => RepaymentSuccessPage(),
      binding: CreditScoreBindings(),
    ),
    GetPage(
      name: AppRoute.eventSearch,
      page: () => SmeEventSearchPage(),
      binding: SmeEventBindings(),
    ),
    GetPage(
      name: AppRoute.eventDetail(":id"),
      page: () => SmeDetailEventPage(),
      binding: SmeEventBindings(),
    ),
    GetPage(
      name: AppRoute.eventRegistered,
      page: () => SmeEventRegisteredPage(),
      binding: SmeEventBindings(),
    ),
    GetPage(
      name: AppRoute.eventInvoice(":id"),
      page: () => SmeEventInvoicePage(),
      binding: SmeEventBindings(),
    ),
    GetPage(
      name: AppRoute.eventPayment(":id"),
      page: () => SmeEventPaymentPage(),
      binding: SmeEventBindings(),
    ),
    GetPage(
      name: AppRoute.eventSuccess,
      page: () => SmeEventSuccessPage(),
      binding: SmeEventBindings(),
    ),
    GetPage(
      name: AppRoute.eoEvent,
      page: () => EoEventPage(),
      binding: EoEventBindings(),
    ),
    GetPage(
      name: AppRoute.eoCreateEvent,
      page: () => EoCreateEventPage(),
      binding: EoEventBindings(),
    ),
    GetPage(
      name: AppRoute.eoEventMap,
      page: () => EoEventMapPage(),
      binding: EoEventBindings(),
    ),
    GetPage(
      name: AppRoute.eoEventDraft,
      page: () => EoEventDraftPage(),
      binding: EoEventBindings(),
    ),
    GetPage(
      name: AppRoute.eoDetailEvent(":id"),
      page: () => EoDetailEventPage(),
      binding: EoEventBindings(),
    ),
    GetPage(
      name: AppRoute.eoEditEvent(":id"),
      page: () => EoCreateEventPage(isEdit: true),
      binding: EoEventBindings(),
    ),
    GetPage(
      name: AppRoute.eoEventPublish(":id"),
      page: () => EoEventPublishPage(),
      binding: EoEventBindings(),
    ),
    GetPage(
      name: AppRoute.eoHome,
      page: () => EoHomePage(),
      binding: EoHomeBindings(),
    ),
    GetPage(
      name: AppRoute.eoAvailableTenants(":id"),
      page: () => EoAvailableTenantsPage(),
      binding: EoTenantsBindings(),
    ),
    GetPage(
      name: AppRoute.eoRegisteredTenants(":id"),
      page: () => EoRegisteredTenantsPage(),
      binding: EoTenantsBindings(),
    ),
    GetPage(
      name: AppRoute.eoSetting,
      page: () => EoSettingPage(),
      binding: EoHomeBindings(),
    ),
  ];
}
