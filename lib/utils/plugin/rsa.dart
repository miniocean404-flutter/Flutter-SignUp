import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:flutter_sign_in/utils/plugin/logger.dart';
import 'package:pointycastle/asymmetric/api.dart';

// 解密RSA公钥
Future<String> decryptedRsa(RSAPublicKey publicKey, Encrypted encrypted) async {
  final privKey = await parseKeyFromFile<RSAPrivateKey>('test/private.pem');

  final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privKey));
  final decrypted = encrypter.decrypt(encrypted);

  return decrypted;
}

// RSA加密解密器
void encrypterRsa() async {
  final publicKey = await parseKeyFromFile<RSAPublicKey>('test/public.pem');
  final privKey = await parseKeyFromFile<RSAPrivateKey>('test/private.pem');

  const plainText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit';
  final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privKey));

  final encrypted = encrypter.encrypt(plainText);
  final decrypted = encrypter.decrypt(encrypted);

  // Lorem ipsum dolor sit amet, consectetur adipiscing elit
  logger.i(decrypted);
  // kO9EbgbrSwiq0EYz0aBdljHSC/rci2854Qa+nugbhKjidlezNplsEqOxR+pr1RtICZGAtv0YGevJBaRaHS17eHuj7GXo1CM3PR6pjGxrorcwR5Q7/bVEePESsimMbhHWF+AkDIX4v0CwKx9lgaTBgC8/yJKiLmQkyDCj64J3JSE=
  logger.i(encrypted.base64);
}
