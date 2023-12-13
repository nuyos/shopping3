//address_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class KakaoAddressScreen extends StatelessWidget {
  KakaoAddressScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {};

  final TextEditingController _postcodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _addressDetailController =
  TextEditingController();

  Widget _gap() {
    return const SizedBox(
      height: 10,
    );
  }

  void _searchAddress(BuildContext context) async {
    KopoModel? model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
        fullscreenDialog: true,
      ),
    );

    if (model != null) {
      final postcode = model.zonecode ?? '';
      _postcodeController.value = TextEditingValue(
        text: postcode,
      );
      formData['postcode'] = postcode;

      final address = model.address ?? '';
      _addressController.value = TextEditingValue(
        text: address,
      );
      formData['address'] = address;

      final buildingName = model.buildingName ?? '';
      _addressDetailController.value = TextEditingValue(
        text: buildingName,
      );
      formData['address_detail'] = buildingName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54, //  우리 앱 컬러로 바꾸기
        title: const Text('박혁준 옷 입히기 주소받기'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: '이름',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '연락처',
                    ),
                  ),
                  TextFormField(
                    controller: _postcodeController,
                    decoration: const InputDecoration(
                      hintText: '우편번호',
                    ),
                    readOnly: true,
                  ),
                  _gap(),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      hintText: '기본주소',
                    ),
                    readOnly: true,
                  ),
                  _gap(),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: _addressDetailController,
                    decoration: const InputDecoration(
                      hintText: '상세주소 입력',
                    ),
                  ),
                  _gap(),
                  CupertinoButton(
                    onPressed: () => _searchAddress(context),
                    child: const Text('주소검색'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: '배송시 요청사항',
                    ),
                  ),
                  _gap(),
                  ElevatedButton(
                    onPressed: () {
                      // 여기에 결제 화면으로 이동하는 코드 추가
                    },
                    child: Text('결제 계속 진행하기'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black54,
                      onPrimary: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
