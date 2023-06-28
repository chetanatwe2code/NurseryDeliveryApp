class PriceConverter {

  static Map<String,String> getGstAndDiscountPrice({
    double? mrp,
    double? discount,
    double? sGst,
    double? cGst}) {
    mrp ??= 0;
    discount ??= 0;
    sGst ??= 0;
    cGst ??= 0;
    double sGstPrice = 0;
    double cGstPrice = 0;
    double discountPrice = 0;
    if(sGst > 0){
      sGstPrice += mrp * (sGst / 100) / (1 + (sGst / 100));
    }
    if(sGst > 0){
      cGstPrice += mrp * (cGst / 100) / (1 + (cGst / 100));
    }
    if(discount > 0){
      discountPrice += (mrp * discount) / 100;
    }

    return {
      "gst" : "\u{20B9}${removeDecimalZeroFormat(sGstPrice + cGstPrice)}",
      "sGst" : "\u{20B9}${removeDecimalZeroFormat(sGstPrice)}",
      "cGst" : "\u{20B9}${removeDecimalZeroFormat(cGst)}",
      "discountPrice" : "\u{20B9}${removeDecimalZeroFormat(discountPrice)}"
    };
  }

  static double removeDecimalZeroFormat(double value , { int asFixed = 2 }) {
    return double.tryParse(value.toStringAsFixed(asFixed))??0.0;
  }

  static String removeDecimalZeroFormat2(double value , { int asFixed = 0 }) {
    return value.toStringAsFixed(asFixed);
  }

  static String removeDecimalZeroFormatWithFlag(double value , { int asFixed = 0 }) {
    return "\u{20B9}${value.toStringAsFixed(asFixed)}";
  }

  static String getFlag() {
    return "\u{20B9}";
  }

}