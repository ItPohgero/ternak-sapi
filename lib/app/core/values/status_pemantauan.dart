import 'package:pemantauan_ternak/app/core/values/colors.dart';

class StatusPemantauan {
  static const IB = "ib";
  static const CBR_1 = "cek_birahi_1";
  static const CBR_2 = "cek_birahi_2";
  static const PKB_1 = "pkb_1";
  static const PKB_2 = "pkb_2";
  static const PKB_3 = "pkb_3";
  static const KELAHIRAN = "kelahiran";
  static const POST_PARTUS = "post_partus";
  static const IB_ULANG = "ib_ulang";
  static const PKB_ULANG = "pkb_ulang";
  static const PENGOBATAN = "pengobatan";

  static const COLORS = {
    StatusPemantauan.IB: ColorsPallete.PRIMARY,
    StatusPemantauan.CBR_1: ColorsPallete.WARNING,
    StatusPemantauan.CBR_2: ColorsPallete.WARNING,
    StatusPemantauan.PKB_1: ColorsPallete.TERTIARY,
    StatusPemantauan.PKB_2: ColorsPallete.TERTIARY,
    StatusPemantauan.PKB_3: ColorsPallete.TERTIARY,
    StatusPemantauan.KELAHIRAN: ColorsPallete.PRIMARY,
    StatusPemantauan.POST_PARTUS: ColorsPallete.TERTIARY,
    StatusPemantauan.IB_ULANG: ColorsPallete.DANGER,
    StatusPemantauan.PKB_ULANG: ColorsPallete.DANGER,
    StatusPemantauan.PENGOBATAN: ColorsPallete.DANGER
  };
}
