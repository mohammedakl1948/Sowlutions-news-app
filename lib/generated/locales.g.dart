class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': Locales.en,
    'ar': Locales.ar,
  };
}

class LocaleKeys {
  LocaleKeys._();
  static const Get_Started = 'Get_Started';
  static const Stock_Quotations = 'Stock_Quotations';
  static const SymbolEn = 'SymbolEn';
  static const Last = 'Last';
  static const Open = 'Open';
  static const Low = 'Low';
  static const High = 'High';
  static const Volume = 'Volume';
  static const Change = 'Change';
}

class Locales {
  static const en = {

    'Get_Started': 'Get Started',
    'Stock_Quotations': 'Stock Quotations',
    'SymbolEn': 'SymbolEn',
    'Last': 'Last',
    'Open': 'Open',
    'Low': 'Low',
    'High': 'High',
    'Volume': 'Volume',
    'Change': 'Change',
  };
  static const ar = {
    'Get_Started': 'البدء',
    'Stock_Quotations': 'أسعار الأسهم',
    'SymbolEn': '',
    'Last': '',
    'Open': '',
    'Low': '',
    'High': '',
    'Volume': '',
    'Change': '',
  };
}
