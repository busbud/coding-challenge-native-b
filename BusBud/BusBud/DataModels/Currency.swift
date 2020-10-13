//
//  Currency.swift
//  BusBud
//
//  Created by Ali Pourhadi on 2020-10-12.
//

// swiftlint:disable identifier_name
// swiftlint:disable file_length
import Foundation

// reference: https://www.iban.com/currency-codes
/// List of all available / supported currencies.
enum Currency: String, CaseIterable {
  case afghani = "Afghani"
  case algerianDinar = "Algerian Dinar"
  case argentinePeso = "Argentine Peso"
  case armenianDram = "Armenian Dram"
  case arubanFlorin = "Aruban Florin"
  case australianDollar = "Australian Dollar"
  case azerbaijaniManat = "Azerbaijani Manat"
  case bahamianDollar = "Bahamian Dollar"
  case bahrainiDinar = "Bahraini Dinar"
  case baht = "Baht"
  case balboa = "Balboa"
  case barbadosDollar = "Barbados Dollar"
  case belarussianRuble = "Belarussian Ruble"
  case belizeDollar = "Belize Dollar"
  case bermudianDollar = "Bermudian Dollar"
  case bolivar = "Bolivar"
  case boliviano = "Boliviano"
  case brazilianReal = "Brazilian Real"
  case bruneiDollar = "Brunei Dollar"
  case bulgarianLev = "Bulgarian Lev"
  case burundiFranc = "Burundi Franc"
  case caboVerdeEscudo = "Cabo Verde Escudo"
  case canadianDollar = "Canadian Dollar"
  case caymanIslandsDollar = "Cayman Islands Dollar"
  case cfaFrancBCEAO = "CFA Franc BCEAO"
  case cfaFrancBEAC = "CFA Franc BEAC"
  case cfpFranc = "CFP Franc"
  case chileanPeso = "Chilean Peso"
  case colombianPeso = "Colombian Peso"
  case comoroFranc = "Comoro Franc"
  case congoleseFranc = "Congolese Franc"
  case convertibleMark = "Convertible Mark"
  case cordobaOro = "Cordoba Oro"
  case costaRicanColon = "Costa Rican Colon"
  case cubanPeso = "Cuban Peso"
  case czechKoruna = "Czech Koruna"
  case dalasi = "Dalasi"
  case danishKrone = "Danish Krone"
  case denar = "Denar"
  case djiboutiFranc = "Djibouti Franc"
  case dobra = "Dobra"
  case dominicanPeso = "Dominican Peso"
  case dong = "Dong2"
  case eastCaribbeanDollar = "East Caribbean Dollar"
  case egyptianPound = "Egyptian Pound"
  case elSalvadorColon = "El Salvador Colon"
  case ethiopianBirr = "Ethiopian Birr"
  case euro = "Euro"
  case falklandIslandsPound = "Falkland Islands Pound"
  case fijiDollar = "Fiji Dollar"
  case forint = "Forint"
  case ghanaCedi = "Ghana Cedi"
  case gibraltarPound = "Gibraltar Pound"
  case gourde = "Gourde"
  case guarani = "Guarani"
  case guineaFranc = "Guinea Franc"
  case guyanaDollar = "Guyana Dollar"
  case hongKongDollar = "Hong Kong Dollar"
  case hryvnia = "Hryvnia"
  case icelandKrona = "Iceland Krona"
  case indianRupee = "Indian Rupee"
  case iranianRial = "Iranian Rial"
  case iraqiDinar = "Iraqi Dinar"
  case jamaicanDollar = "Jamaican Dollar"
  case jordanianDinar = "Jordanian Dinar"
  case kenyanShilling = "Kenyan Shilling"
  case kina = "Kina"
  case kip = "Kip"
  case kuna = "Kuna"
  case kuwaitiDinar = "Kuwaiti Dinar"
  case Kwacha = "Kwacha"
  case kwanza = "Kwanza"
  case kyat = "Kyat"
  case lari = "Lari"
  case lebanesePounds = "Lebanese Pounds"
  case lek = "Lek"
  case lempira = "Lempira"
  case leone = "Leone"
  case liberianDollar = "Liberian Dollar"
  case libyanDinar = "Libyan Dinar"
  case lilangeni = "Lilangeni"
  case loti = "Loti"
  case malagasyAriary = "Malagasy Ariary"
  case malaysianRinggit = "Malaysian Ringgit"
  case mauritiusRupee = "Mauritius Rupee"
  case mexicanPeso = "Mexican Peso"
  case mexicanUnidadDeInversion = "Mexican Unidad de Inversion"
  case moldovanLeu = "Moldovan Leu"
  case moroccanDirham = "Moroccan Dirham"
  case mozambiqueMetical = "Mozambique Metical"
  case mvdol = "Mvdol"
  case naira = "Naira"
  case nakfa = "Nakfa"
  case namibiaDollar = "Namibia Dollar"
  case nepaleseRupee = "NepaleseRupee"
  case netherlandsAntilleanGuilder = "Netherlands Antillean Guilder"
  case newIsraeliSheqel = "New Israeli Sheqel"
  case newTaiwanDollar = "New Taiwan Dollar"
  case newZealandDollar = "New Zealand Dollar"
  case ngultrum = "Ngultrum"
  case northKoreanWon = "North Korean Won"
  case norwegianKrone = "Norwegian Krone"
  case nuevoSol = "Nuevo Sol"
  case ouguiya = "Ouguiya"
  case pakistanRupee = "Pakistan Rupee"
  case pataca = "Pataca"
  case paanga = "Pa’anga"
  case pesoConvertible = "Peso Convertible"
  case pesoUruguayo = "Peso Uruguayo"
  case philippinePeso = "Philippine Peso"
  case poundSterling = "Pound Sterling"
  case pula = "Pula"
  case qatariRial = "Qatari Rial"
  case quetzal = "Quetzal"
  case rand = "Rand"
  case rialomani = "RialOmani"
  case riel = "Riel"
  case romanianLeu = "Romanian Leu"
  case rufiyaa = "Rufiyaa"
  case rupiah = "Rupiah"
  case russianRuble = "Russian Ruble"
  case rwandaFranc = "Rwanda Franc"
  case saintHelenaPound = "Saint Helena Pound"
  case saudiRiyal = "Saudi Riyal"
  case specialDrawingRight = "Special Drawing Right"
  case serbianDinar = "Serbian Dinar"
  case seychellesRupee = "Seychelles Rupee"
  case singaporeDollar = "Singapore Dollar"
  case solomonIslandsDollar = "Solomon Islands Dollar"
  case som = "Som"
  case somaliShilling = "Somali Shilling"
  case somoni = "Somoni"
  case southSudanesePound = "South Sudanese Pound"
  case sriLankaRupee = "Sri Lanka Rupee"
  case sucre = "Sucre"
  case sudanesePound = "Sudanese Pound"
  case surinamDollar = "Surinam Dollar"
  case swedishKrona = "Swedish Krona"
  case swissFranc = "Swiss Franc"
  case syrianPound = "Syrian Pound"
  case taka = "Taka"
  case tala = "Tala"
  case tanzanianShilling = "Tanzanian Shilling"
  case tenge = "Tenge"
  case trinidadAndTobagoDollar = "Trinidad and Tobago Dollar"
  case tugrik = "Tugrik"
  case tunisianDinar = "Tunisian Dinar"
  case turkishLira = "Turkish Lira"
  case turkmenistanNewManat = "Turkmenistan New Manat"
  case uaeDirham = "UAE Dirham"
  case ugandaShilling = "Uganda Shilling"
  case unidadDeFomento = "Unidad de Fomento"
  case unidadDeValorReal = "Unidad de Valor Real"
  case uruguayPesoEnUnidadesIndexadas = "Uruguay Peso en Unidades Indexadas"
  case usDollar = "US Dollar"
  case uzbekistanSum = "Uzbekistan Sum"
  case vatu = "Vatu"
  case won = "Won"
  case yemeniRial = "Yemeni Rial"
  case yen = "Yen"
  case yuanRenminbi = "Yuan Renminbi"
  case zambianKwacha = "Zambian Kwacha"
  case zimbabweDollar = "Zimbabwe Dollar"
  case zloty = "Zloty"

  /// The unique code of the currency by `ISO 4217`.
  var code: String {
    switch self {
    case .afghani:
      return "AFN"
    case .algerianDinar:
      return "DZD"
    case .argentinePeso:
      return "ARS"
    case .armenianDram:
      return "AMD"
    case .arubanFlorin:
      return "AWG"
    case .australianDollar:
      return "AUD"
    case .azerbaijaniManat:
      return "AZN"
    case .bahamianDollar:
      return "BSD"
    case .bahrainiDinar:
      return "BHD"
    case .baht:
      return "THB"
    case .balboa:
      return "PAB"
    case .barbadosDollar:
      return "BBD"
    case .belarussianRuble:
      return "BYN"
    case .belizeDollar:
      return "BZD"
    case .bermudianDollar:
      return "BMD"
    case .bolivar:
      return "VEF"
    case .boliviano:
      return "BOB"
    case .brazilianReal:
      return "BRL"
    case .bruneiDollar:
      return "BND"
    case .bulgarianLev:
      return "BGN"
    case .burundiFranc:
      return "BIF"
    case .caboVerdeEscudo:
      return "CVE"
    case .canadianDollar:
      return "CAD"
    case .caymanIslandsDollar:
      return "KYD"
    case .cfaFrancBCEAO:
      return "XOF"
    case .cfaFrancBEAC:
      return "XAF"
    case .cfpFranc:
      return "XPF"
    case .chileanPeso:
      return "CLP"
    case .colombianPeso:
      return "COP"
    case .comoroFranc:
      return "KMF"
    case .congoleseFranc:
      return "CDF"
    case .convertibleMark:
      return "BAM"
    case .cordobaOro:
      return "NIO"
    case .costaRicanColon:
      return "CRC"
    case .cubanPeso:
      return "CUP"
    case .czechKoruna:
      return "CZK"
    case .dalasi:
      return "GMD"
    case .danishKrone:
      return "DKK"
    case .denar:
      return "MKD"
    case .djiboutiFranc:
      return "DJF"
    case .dobra:
      return "STN"
    case .dominicanPeso:
      return "DOP"
    case .dong:
      return "VND"
    case .eastCaribbeanDollar:
      return "XCD"
    case .egyptianPound:
      return "EFp"
    case .elSalvadorColon:
      return "SVC"
    case .ethiopianBirr:
      return "ETB"
    case .euro:
      return "EUR"
    case .falklandIslandsPound:
      return "FKP"
    case .fijiDollar:
      return "FJD"
    case .forint:
      return "HUF"
    case .ghanaCedi:
      return "GHS"
    case .gibraltarPound:
      return "GIP"
    case .gourde:
      return "HTG"
    case .guarani:
      return "PYG"
    case .guineaFranc:
      return "GNF"
    case .guyanaDollar:
      return "GYD"
    case .hongKongDollar:
      return "HKD"
    case .hryvnia:
      return "UAH"
    case .icelandKrona:
      return "ISK"
    case .indianRupee:
      return "INR"
    case .iranianRial:
      return "IRR"
    case .iraqiDinar:
      return "IQD"
    case .jamaicanDollar:
      return "JMD"
    case .jordanianDinar:
      return "JOD"
    case .kenyanShilling:
      return "KES"
    case .kina:
      return "KES"
    case .kip:
      return "LAK"
    case .kuna:
      return "HRK"
    case .kuwaitiDinar:
      return "KWD"
    case .Kwacha:
      return "MWK"
    case .kwanza:
      return "AOA"
    case .kyat:
      return "MMK"
    case .lari:
      return "GEL"
    case .lebanesePounds:
      return "LBP"
    case .lek:
      return "ALL"
    case .lempira:
      return "HNL"
    case .leone:
      return "SLL"
    case .liberianDollar:
      return "LRD"
    case .libyanDinar:
      return "LYD"
    case .lilangeni:
      return "SZL"
    case .loti:
      return "LSL"
    case .malagasyAriary:
      return "MGA"
    case .malaysianRinggit:
      return "MYR"
    case .mauritiusRupee:
      return "MUR"
    case .mexicanPeso:
      return "MXN"
    case .mexicanUnidadDeInversion:
      return "MXV"
    case .moldovanLeu:
      return "MDL"
    case .moroccanDirham:
      return "MAD"
    case .mozambiqueMetical:
      return "MZN"
    case .mvdol:
      return "BOV"
    case .naira:
      return "NGN"
    case .nakfa:
      return "ERN"
    case .namibiaDollar:
      return "NAD"
    case .nepaleseRupee:
      return "NPR"
    case .netherlandsAntilleanGuilder:
      return "ANG"
    case .newIsraeliSheqel:
      return "ILS"
    case .newTaiwanDollar:
      return "TWD"
    case .newZealandDollar:
      return "NZD"
    case .ngultrum:
      return "BTN"
    case .northKoreanWon:
      return "KPW"
    case .norwegianKrone:
      return "NOK"
    case .nuevoSol:
      return "PEN"
    case .ouguiya:
      return "MRU"
    case .pakistanRupee:
      return "PKR"
    case .pataca:
      return "MOP"
    case .paanga:
      return "TOP"
    case .pesoConvertible:
      return "CUC"
    case .pesoUruguayo:
      return "UYU"
    case .philippinePeso:
      return "PHP"
    case .poundSterling:
      return "GBP"
    case .pula:
      return "BWP"
    case .qatariRial:
      return "QAR"
    case .quetzal:
      return "GTQ"
    case .rand:
      return "ZAR"
    case .rialomani:
      return "OMR"
    case .riel:
      return "KHR"
    case .romanianLeu:
      return "RON"
    case .rufiyaa:
      return "MVR"
    case .rupiah:
      return "IDR"
    case .russianRuble:
      return "RUB"
    case .rwandaFranc:
      return "RWF"
    case .saintHelenaPound:
      return "SHP"
    case .saudiRiyal:
      return "SAR"
    case .specialDrawingRight:
      return "XDR"
    case .serbianDinar:
      return "RSD"
    case .seychellesRupee:
      return "SCR"
    case .singaporeDollar:
      return "SGD"
    case .solomonIslandsDollar:
      return "SBD"
    case .som:
      return "KGS"
    case .somaliShilling:
      return "SOS"
    case .somoni:
      return "TJS"
    case .southSudanesePound:
      return "SSP"
    case .sriLankaRupee:
      return "LKR"
    case .sucre:
      return "XSU"
    case .sudanesePound:
      return "SDG"
    case .surinamDollar:
      return "SRD"
    case .swedishKrona:
      return "SEK"
    case .swissFranc:
      return "CHF"
    case .syrianPound:
      return "SYP"
    case .taka:
      return "BDT"
    case .tala:
      return "WST"
    case .tanzanianShilling:
      return "TZS"
    case .tenge:
      return "KZT"
    case .trinidadAndTobagoDollar:
      return "TTD"
    case .tugrik:
      return "MNT"
    case .tunisianDinar:
      return "TND"
    case .turkishLira:
      return "TRY"
    case .turkmenistanNewManat:
      return "TMT"
    case .uaeDirham:
      return "AED"
    case .ugandaShilling:
      return "UGX"
    case .unidadDeFomento:
      return "CLF"
    case .unidadDeValorReal:
      return "COU"
    case .uruguayPesoEnUnidadesIndexadas:
      return "UYI"
    case .usDollar:
      return "USN"
    case .uzbekistanSum:
      return "UZS"
    case .vatu:
      return "VUV"
    case .won:
      return "KRW"
    case .yemeniRial:
      return "YER"
    case .yen:
      return "JPY"
    case .yuanRenminbi:
      return "CNY"
    case .zambianKwacha:
      return "ZMW"
    case .zimbabweDollar:
      return "ZWL"
    case .zloty:
      return "PLN"
    }
  }

  /// The native symbol of the currency.
  var symbol: String {
    switch self {
    case .afghani:
      return "؋"
    case .algerianDinar:
      return "دج"
    case .argentinePeso:
      return "$"
    case .armenianDram:
      return "֏"
    case .arubanFlorin:
      return "ƒ"
    case .australianDollar:
      return "A$"
    case .azerbaijaniManat:
      return "₼"
    case .bahamianDollar:
      return "B$"
    case .bahrainiDinar:
      return ".د.ب"
    case .baht:
      return "฿"
    case .balboa:
      return "B/."
    case .barbadosDollar:
      return "Bds$"
    case .belarussianRuble:
      return "Br"
    case .belizeDollar:
      return "$"
    case .bermudianDollar:
      return "$"
    case .bolivar:
      return "Bs."
    case .boliviano:
      return "Bs"
    case .brazilianReal:
      return "R$"
    case .bruneiDollar:
      return "B$"
    case .bulgarianLev:
      return "Лв."
    case .burundiFranc:
      return "FBu"
    case .caboVerdeEscudo:
      return "$"
    case .canadianDollar:
      return "$"
    case .caymanIslandsDollar:
      return "$"
    case .cfaFrancBCEAO:
      return "CFA"
    case .cfaFrancBEAC:
      return "FCFA"
    case .cfpFranc:
      return "₣"
    case .chileanPeso:
      return "$"
    case .colombianPeso:
      return "$"
    case .comoroFranc:
      return "CF"
    case .congoleseFranc:
      return "FC"
    case .convertibleMark:
      return "KM"
    case .cordobaOro:
      return "C$"
    case .costaRicanColon:
      return "₡"
    case .cubanPeso:
      return "$MN"
    case .czechKoruna:
      return "Kč"
    case .dalasi:
      return "D"
    case .danishKrone:
      return "Kr."
    case .denar:
      return "Ден"
    case .djiboutiFranc:
      return "Fdj"
    case .dobra:
      return "Db"
    case .dominicanPeso:
      return "RD$"
    case .dong:
      return "₫"
    case .eastCaribbeanDollar:
      return "$"
    case .egyptianPound:
      return "ج.م"
    case .elSalvadorColon:
      return "₡"
    case .ethiopianBirr:
      return "ብር"
    case .euro:
      return "€"
    case .falklandIslandsPound:
      return "£"
    case .fijiDollar:
      return "FJ$"
    case .forint:
      return "Ft"
    case .ghanaCedi:
      return "GH₵"
    case .gibraltarPound:
      return "£"
    case .gourde:
      return "G"
    case .guarani:
      return "₲"
    case .guineaFranc:
      return "FG"
    case .guyanaDollar:
      return "G$"
    case .hongKongDollar:
      return "HK$"
    case .hryvnia:
      return "₴"
    case .icelandKrona:
      return "Íkr"
    case .indianRupee:
      return "₹"
    case .iranianRial:
      return "﷼"
    case .iraqiDinar:
      return "ع.د"
    case .jamaicanDollar:
      return "$"
    case .jordanianDinar:
      return "د.ا"
    case .kenyanShilling:
      return "Ksh"
    case .kina:
      return "K"
    case .kip:
      return "₭"
    case .kuna:
      return "kn"
    case .kuwaitiDinar:
      return "KD"
    case .Kwacha:
      return "ZK"
    case .kwanza:
      return "Kz"
    case .kyat:
      return "K"
    case .lari:
      return "ლ"
    case .lebanesePounds:
      return ".ل.ل"
    case .lek:
      return "Lek"
    case .lempira:
      return "L"
    case .leone:
      return "Le"
    case .liberianDollar:
      return ""
    case .libyanDinar:
      return "L$"
    case .lilangeni:
      return ""
    case .loti:
      return "ل.د"
    case .malagasyAriary:
      return "M"
    case .malaysianRinggit:
      return "RM"
    case .mauritiusRupee:
      return "Rs"
    case .mexicanPeso:
      return "Mex$"
    case .mexicanUnidadDeInversion:
      return "MXV"
    case .moldovanLeu:
      return "L"
    case .moroccanDirham:
      return "MAD"
    case .mozambiqueMetical:
      return "MT"
    case .mvdol:
      return "b$"
    case .naira:
      return "₦"
    case .nakfa:
      return "ናቕፋ"
    case .namibiaDollar:
      return "N$"
    case .nepaleseRupee:
      return "Re."
    case .netherlandsAntilleanGuilder:
      return "NAƒ"
    case .newIsraeliSheqel:
      return "₪"
    case .newTaiwanDollar:
      return "NT$"
    case .newZealandDollar:
      return "$"
    case .ngultrum:
      return "Nu."
    case .northKoreanWon:
      return "₩"
    case .norwegianKrone:
      return "Kr"
    case .nuevoSol:
      return "S/"
    case .ouguiya:
      return "UM"
    case .pakistanRupee:
      return "Rs"
    case .pataca:
      return "MOP$"
    case .paanga:
      return "T$"
    case .pesoConvertible:
      return "CUC$"
    case .pesoUruguayo:
      return "$U"
    case .philippinePeso:
      return "₱"
    case .poundSterling:
      return "£"
    case .pula:
      return "P"
    case .qatariRial:
      return "ر.ق"
    case .quetzal:
      return "Q"
    case .rand:
      return "R"
    case .rialomani:
      return "ر.ع."
    case .riel:
      return "៛"
    case .romanianLeu:
      return "lei"
    case .rufiyaa:
      return "Rf"
    case .rupiah:
      return "Rp"
    case .russianRuble:
      return "₽"
    case .rwandaFranc:
      return "R₣"
    case .saintHelenaPound:
      return "£"
    case .saudiRiyal:
      return "ريال"
    case .specialDrawingRight:
      return "SDR"
    case .serbianDinar:
      return "din"
    case .seychellesRupee:
      return "SR"
    case .singaporeDollar:
      return "S$"
    case .solomonIslandsDollar:
      return "Si$"
    case .som:
      return "Лв"
    case .somaliShilling:
      return "Sh.so."
    case .somoni:
      return "SM"
    case .southSudanesePound:
      return "£"
    case .sriLankaRupee:
      return "රු"
    case .sucre:
      return "S/."
    case .sudanesePound:
      return "ج.س"
    case .surinamDollar:
      return "$"
    case .swedishKrona:
      return "Kr"
    case .swissFranc:
      return "CHF"
    case .syrianPound:
      return "£S"
    case .taka:
      return "৳"
    case .tala:
      return "WS$"
    case .tanzanianShilling:
      return "TSh"
    case .tenge:
      return "₸"
    case .trinidadAndTobagoDollar:
      return "TT$"
    case .tugrik:
      return "₮"
    case .tunisianDinar:
      return "د.ت"
    case .turkishLira:
      return "₺"
    case .turkmenistanNewManat:
      return "T"
    case .uaeDirham:
      return "د.إ"
    case .ugandaShilling:
      return "USh"
    case .unidadDeFomento:
      return "UF"
    case .unidadDeValorReal:
      return "URV"
    case .uruguayPesoEnUnidadesIndexadas:
      return "$"
    case .usDollar:
      return "$"
    case .uzbekistanSum:
      return "лв"
    case .vatu:
      return "VT"
    case .won:
      return "₩"
    case .yemeniRial:
      return "﷼"
    case .yen:
      return "¥"
    case .yuanRenminbi:
      return "¥"
    case .zambianKwacha:
      return "ZK"
    case .zimbabweDollar:
      return "$"
    case .zloty:
      return "zł"
    }
  }

  /// Returns a detailed representation of the currency.
  /// Example: US Dollar (USD)
  var detailedRepresentation: String {
    return "\(self.rawValue) (\(self.code))"
  }
}
