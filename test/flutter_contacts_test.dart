import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_contacts/flutter_contacts_platform_interface.dart';
import 'package:flutter_contacts/flutter_contacts_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterContactsPlatform
    with MockPlatformInterfaceMixin
    implements FlutterContactsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterContactsPlatform initialPlatform = FlutterContactsPlatform.instance;

  test('$MethodChannelFlutterContacts is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterContacts>());
  });

  test('getPlatformVersion', () async {
    FlutterContacts flutterContactsPlugin = FlutterContacts();
    MockFlutterContactsPlatform fakePlatform = MockFlutterContactsPlatform();
    FlutterContactsPlatform.instance = fakePlatform;

    expect(await flutterContactsPlugin.getPlatformVersion(), '42');
  });
}
