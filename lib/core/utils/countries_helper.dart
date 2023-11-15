// // ignore_for_file: public_member_api_docs

// /// this enum is the country code
// enum CountryCode {
//   egypt,
//   turkey,
//   usa,
//   bahrain,
//   france,
//   saudiArabia,
//   rwanda,
//   qatar,
//   oman,
//   nigeria,
//   kuwait,
//   kenya,
//   ghana,
//   uae,
// }

// /// this class is the countries helper
// class CountriesHelper {
//   /// constructor
//   CountriesHelper({
//     required this.englishCountryName,
//     required this.arabicCountryName,
//     required this.code,
//     required this.countryFlag,
//     required this.codeName,
//     required this.maxPhoneLength,
//   });

//   /// get country code
//   factory CountriesHelper.getCountryCode({
//     required CountryCode countryCode,
//   }) {
//     return CountriesHelper(
//       englishCountryName: codes[countryCode]!['english_name'].toString(),
//       arabicCountryName: codes[countryCode]!['arabic_name'].toString(),
//       code: codes[countryCode]!['code'].toString(),
//       countryFlag: codes[countryCode]!['flag'].toString(),
//       codeName: codes[countryCode]!['country_code'].toString(),
//       maxPhoneLength: int.parse(
//         codes[countryCode]!['maxPhoneLength'].toString(),
//       ),
//     );
//   }
//   CountryCode? countryCode;

//   String englishCountryName;
//   String arabicCountryName;
//   String code;
//   String countryFlag;
//   String codeName;
//   int maxPhoneLength;

//   /// this map is the countries codes
//   static const codes = {
//     CountryCode.bahrain: {
//       'code': '+973',
//       'english_name': 'Bahrain',
//       'arabic_name': 'البحرين',
//       'country_code': 'bh',
//       'maxPhoneLength': 8,
//       'flag': '🇧🇭',
//     },
//     CountryCode.egypt: {
//       'code': '+20',
//       'english_name': 'Egypt',
//       'arabic_name': 'مصر',
//       'country_code': 'eg',
//       'maxPhoneLength': 10,
//       'flag': '🇪🇬',
//     },
//     CountryCode.france: {
//       'code': '+33',
//       'english_name': 'France',
//       'arabic_name': 'فرنسا',
//       'country_code': 'fr',
//       'maxPhoneLength': 9,
//       'flag': '🇫🇷',
//     },
//     CountryCode.ghana: {
//       'code': '+233',
//       'english_name': 'Ghana',
//       'arabic_name': 'غانا',
//       'country_code': 'gh',
//       'maxPhoneLength': 10,
//       'flag': '🇬🇭',
//     },
//     CountryCode.kenya: {
//       'code': '+254',
//       'english_name': 'Kenya',
//       'arabic_name': 'كينيا',
//       'country_code': 'ke',
//       'maxPhoneLength': 10,
//       'flag': '🇰🇪',
//     },
//     CountryCode.kuwait: {
//       'code': '+965',
//       'english_name': 'Kuwait',
//       'arabic_name': 'الكويت',
//       'country_code': 'kw',
//       'maxPhoneLength': 8,
//       'flag': '🇰🇼',
//     },
//     CountryCode.nigeria: {
//       'code': '+234',
//       'english_name': 'Nigeria',
//       'arabic_name': 'نيجيريا',
//       'country_code': 'ng',
//       'maxPhoneLength': 11,
//       'flag': '🇳🇬',
//     },
//     CountryCode.oman: {
//       'code': '+968',
//       'english_name': 'Oman',
//       'arabic_name': 'عمان',
//       'country_code': 'om',
//       'maxPhoneLength': 8,
//       'flag': '🇴🇲',
//     },
//     CountryCode.qatar: {
//       'code': '+974',
//       'english_name': 'Qatar',
//       'arabic_name': 'قطر',
//       'country_code': 'qa',
//       'maxPhoneLength': 8,
//       'flag': '🇶🇦',
//     },
//     CountryCode.rwanda: {
//       'code': '+250',
//       'english_name': 'Rwanda',
//       'arabic_name': 'رواندا',
//       'country_code': 'rw',
//       'maxPhoneLength': 9,
//       'flag': '🇷🇼',
//     },
//     CountryCode.saudiArabia: {
//       'code': '+966',
//       'english_name': 'Saudi Arabia',
//       'arabic_name': 'السعودية',
//       'country_code': 'sa',
//       'maxPhoneLength': 9,
//       'flag': '🇸🇦',
//     },
//     CountryCode.turkey: {
//       'code': '+90',
//       'english_name': 'Turkey',
//       'arabic_name': 'تركيا',
//       'country_code': 'tr',
//       'maxPhoneLength': 10,
//       'flag': '🇹🇷',
//     },
//     CountryCode.uae: {
//       'code': '+971',
//       'english_name': 'UAE',
//       'arabic_name': 'الإمارات',
//       'country_code': 'ae',
//       'maxPhoneLength': 9,
//       'flag': '🇦🇪',
//     },
//     CountryCode.usa: {
//       'code': '+1',
//       'english_name': 'USA',
//       'arabic_name': 'الولايات المتحدة الأمريكية',
//       'country_code': 'us',
//       'maxPhoneLength': 10,
//       'flag': '🇺🇸',
//     },
//   };
// }
