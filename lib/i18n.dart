import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class I18n {
  String get appScreenDashboard => _getText("appScreenDashboard");

  String get appScreenCalendar => _getText("appScreenCalendar");

  String get appScreenContacts => _getText("appScreenContacts");

  String get appScreenGallery => _getText("appScreenGallery");

  String get appScreenJournal => _getText("appScreenJournal");

  String get appScreenSettings => _getText("appScreenSettings");

  String get actionLogout => _getText("actionLogout");

  String get loginHostName => _getText("loginHostName");

  String get loginApiToken => _getText("loginApiToken");

  String get loginErrorHostnameInvalid => _getText("loginErrorHostnameInvalid");

  String get loginErrorConnectionFailed =>
      _getText("loginErrorConnectionFailed");

  String get coreLoading => _getText("coreLoading");

  String get coreNoData => _getText("coreNoData");

  String get dashboardRecentContacts => _getText("dashboardRecentContacts");

  String get dashboardSummary => _getText("dashboardSummary");

  String get contactUnknownBirthdate => _getText("contactUnknownBirthdate");

  String get dashboardUpcomingEvents => _getText("dashboardUpcomingEvents");

  static Map<String, String> _localizedValues;

  static Map<String, String> _enValues = {
    "appScreenDashboard": "Dashboard",
    "appScreenCalendar": "Calendar",
    "appScreenContacts": "Contacts",
    "appScreenGallery": "Photo Gallery",
    "appScreenJournal": "Journal",
    "appScreenSettings": "Settings",
    "actionLogout": "Logout",
    "loginHostName": "Monica Host",
    "loginApiToken": "API Token",
    "loginErrorHostnameInvalid": "Whoops! The hostname appears to be invalid",
    "loginErrorConnectionFailed":
        "Looks like something went wrong. Check your internet connection and API Key",
    "coreLoading": "Loading",
    "coreNoData": "No data",
    "dashboardRecentContacts": "Recent Contacts",
    "dashboardSummary": "Summary",
    "contactUnknownBirthdate": "Birthday not set",
    "dashboardUpcomingEvents": "Upcoming events",
  };

  static Map<String, String> _esValues = {
    "appScreenDashboard": "Panel de inicio",
    "appScreenCalendar": " Calendario",
    "appScreenContacts": "Contactos",
    "appScreenGallery": "Galeria de Fotos",
    "appScreenJournal": "Diario",
    "appScreenSettings": "Ajustes",
    "actionLogout": "Desconectar",
    "loginHostName": "Servidor de Monica",
    "loginApiToken": "Token de la API",
    "loginErrorHostnameInvalid":
        "¡Uyyy! El nombre del servidor parece incorrecto",
    "loginErrorConnectionFailed":
        "Parece que algo ha salido mal. Comprueba tu conexión de internet",
    "coreLoading": "Cargando",
    "coreNoData": "Sin datos",
    "dashboardRecentContacts": "Contactos Recientes",
    "dashboardSummary": "Resumen",
    "contactUnknownBirthdate": "Fecha de cumpleaños desconocido",
    "dashboardUpcomingEvents": "Proximos eventos",
  };

  static Map<String, Map<String, String>> _allValues = {
    "en": _enValues,
    "es": _esValues,
  };

  I18n(Locale locale) {
    this._locale = locale;
    _localizedValues = null;
  }

  Locale _locale;

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  String _getText(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  Locale get currentLocale => _locale;

  String get currentLanguage => _locale.languageCode;

  static Future<I18n> load(Locale locale) async {
    final translations = I18n(locale);
    _localizedValues = _allValues[locale.toString()];
    return translations;
  }
}

class I18nDelegate extends LocalizationsDelegate<I18n> {
  const I18nDelegate();

  static final Set<Locale> supportedLocals = {
    Locale('en'),
    Locale('es'),
  };

  @override
  bool isSupported(Locale locale) => supportedLocals.contains(locale);

  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);

  @override
  bool shouldReload(I18nDelegate old) => false;
}
