import "dart:typed_data";

import "package:pointycastle/digests/sha512.dart";
import "package:pointycastle/api.dart" show KeyParameter;
import "package:pointycastle/macs/hmac.dart";
import "package:pointycastle/digests/ripemd160.dart";
import "package:pointycastle/digests/sha256.dart";
import "package:pointycastle/digests/keccak.dart";

final one = Uint8List.fromList([1]);
final zero = Uint8List.fromList([0]);

// RIPEMD-160
Uint8List ripemd160(Uint8List buffer) {
  return RIPEMD160Digest().process(buffer);
}

// sha256
Uint8List sha256(Uint8List buffer) {
  return SHA256Digest().process(buffer);
}

Uint8List hash160(Uint8List buffer) {
  Uint8List tmp = SHA256Digest().process(buffer);
  return RIPEMD160Digest().process(tmp);
}

Uint8List hmacSHA512(Uint8List key, Uint8List data) {
  final tmp = HMac(SHA512Digest(), 128)..init(KeyParameter(key));
  return tmp.process(data);
}

Uint8List keccak256(Uint8List buffer) {
  return KeccakDigest(256).process(buffer);
}
