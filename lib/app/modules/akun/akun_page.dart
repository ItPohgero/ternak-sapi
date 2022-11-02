import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemantauan_ternak/app/core/utils/message_provider.dart';
import 'package:pemantauan_ternak/app/core/utils/storage_provider.dart';
import 'package:pemantauan_ternak/app/core/values/colors.dart';
import 'package:pemantauan_ternak/app/global_widgets/shape_button.dart';
import 'package:pemantauan_ternak/app/modules/akun/akun_controller.dart';

import 'akun_controller.dart';

class AkunPage extends StatefulWidget {
  @override
  _AkunPageState createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  final _akunForm = GlobalKey<FormState>();

  var _nikController = TextEditingController();
  var _jkController = TextEditingController();
  var _namaController = TextEditingController();
  var _alamatController = TextEditingController();
  var _emailController = TextEditingController();
  var _nohpController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return GetBuilder<AkunController>(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("Akun"),
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Obx(
                      () => (_.isEdit.value)
                          ? IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                if (_akunForm.currentState.validate()) {
                                  _.isEdit.value = false;
                                }
                              })
                          : (_.isLoading.value)
                              ? SizedBox()
                              : IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    _.isEdit.value = true;
                                  }),
                    ),
                  )
                ],
              ),
              body: SafeArea(child: Obx(() {
                if (_.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  _nikController.text = (StorageProvider.isManajerTernak(
                          StorageProvider.getIdRole()))
                      ? _.akun.value.nip
                      : _.akun.value.nik;
                  _jkController.text = (_.akun.value.jenis_kelamin == "l")
                      ? "Laki-laki"
                      : "Perempuan";
                  _namaController.text = _.akun.value.nama;
                  _alamatController.text = _.akun.value.alamat;
                  _emailController.text = _.akun.value.email;
                  _nohpController.text = _.akun.value.nohp;

                  return ListView(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: Form(
                            key: _akunForm,
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: (_.akun.value.gambar.isNotEmpty)
                                        ? CircleAvatar(
                                            maxRadius: 50,
                                            backgroundColor: Colors.transparent,
                                            child: ClipOval(
                                              child: Image(
                                                image: NetworkImage(
                                                    _.akun.value.gambar),
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            maxRadius: 50,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    controller: _namaController,
                                    keyboardType: TextInputType.text,
                                    enabled: _.isEdit.value,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Nama",
                                        border: OutlineInputBorder()),
                                    validator: (val) =>
                                        (val == null || val.isEmpty)
                                            ? "Nama harus diisi.."
                                            : null,
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                    controller: _nikController,
                                    keyboardType: TextInputType.number,
                                    enabled: false,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: (StorageProvider.isPetugas(
                                                StorageProvider.getIdRole())
                                            ? "NIK"
                                            : "NIP"),
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextField(
                                    controller: _jkController,
                                    keyboardType: TextInputType.text,
                                    enabled: false,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Jenis Kelamin",
                                        border: OutlineInputBorder()),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      enabled: _.isEdit.value,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                          labelText: "Email",
                                          border: OutlineInputBorder()),
                                      validator: (val) {
                                        if (val == null || val.isEmpty) {
                                          return "Email harus diisi..";
                                        } else if (!val.isEmail) {
                                          return "Email tidak valid..";
                                        } else {
                                          return null;
                                        }
                                      }),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    controller: _nohpController,
                                    keyboardType: TextInputType.number,
                                    enabled: _.isEdit.value,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        labelText: "Nomor HP",
                                        border: OutlineInputBorder()),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Nomor HP harus diisi..";
                                      } else if (!val.isNumericOnly) {
                                        return "Nomor HP tidak valid..";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    controller: _alamatController,
                                    keyboardType: TextInputType.multiline,
                                    enabled: _.isEdit.value,
                                    decoration: InputDecoration(
                                        labelText: "Alamat",
                                        border: OutlineInputBorder()),
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return "Alamat harus diisi..";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Obx(() => (_.isEdit.value)
                                      ? ShapeButton(
                                          label: "Simpan",
                                          action: () async {
                                            _.isEdit.value = !_.isEdit.value;

                                            await _.updateAkun(
                                                _namaController.text,
                                                int.tryParse(
                                                    _nohpController.text),
                                                _alamatController.text, _emailController.text);
                                            StorageProvider.setNama(
                                                _namaController.text);

                                            await _.getAkun();

                                            MessageProvider.showSnackbar(
                                                context: context,
                                                message:
                                                    "Berhasil memperbarui profil..");
                                            // setState(() {
                                            //   _.logout();
                                            // });
                                          },
                                          color: ColorsPallete.PRIMARY)
                                      : ShapeButton(
                                          label: "Keluar",
                                          action: () {
                                            setState(() {
                                              _.logout();
                                            });
                                          },
                                          color: ColorsPallete.DANGER))
                                ],
                              ),
                            ),
                          ))
                    ],
                  );
                }
              })),
            ));
  }
}
