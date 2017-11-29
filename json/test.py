import base64, binascii, json, hashlib, hmac, math, socket, struct, sys, threading, time, urlparse


# Convert from/to binary and hexidecimal strings (could be replaced with .encode('hex') and .decode('hex'))
hexlify = binascii.hexlify
unhexlify = binascii.unhexlify


def sha256d(message):
  '''Double SHA256 Hashing function.'''

  return hashlib.sha256(hashlib.sha256(message).digest()).digest()


def swap_endian_word(hex_word):
  '''Swaps the endianness of a hexidecimal string of a word and converts to a binary string.'''

  message = unhexlify(hex_word)
  if len(message) % 4 != 0: raise ValueError('Must be 4-byte word aligned')
  return message[::-1]



#version     = "20000000"
#prev_hash   = "00000000000000000000c49584aa14f215f62f35eb32643cd01356dcdf8edf14"
#merkle_root = "449372247e536b527d2f39d186a489a7147bfa294fa3552f7422ad44b5135360"
#ntime       = "5A131AE4"
#nbits       = "1800CE4B"
#nonce       = "0A4405EC"

#version     = "00000001"
#prev_hash   = "00000000000008a3a41b85b8b29ad444def299fee21793cd8b9e567eab02cd81"
#merkle_root = "2b12fcf1b09288fcaff797d71e950e71ae42b91e8bdb2304758dfcffc2b620e3"
#ntime       = "4DD7F5C7"
#nbits       = "1A44B9F2"
#nonce       = "9546A142"

version     = "20000000"
prev_hash   = "0000000000000000005858d63912f89e244f83d138b4e0b00b54430b2877a57c"
merkle_root = "cca6efe8483e81a28ed7fc2db1439d34d2224991de81ed73233a8cb613750423"
ntime       = "5A131A38"
nbits       = "1800CE4B"
nonce       = "D07712D9"

header_bin = swap_endian_word(version) + swap_endian_word(prev_hash) + swap_endian_word(merkle_root) + swap_endian_word(ntime) + swap_endian_word(nbits) + swap_endian_word(nonce)

print(header_bin.encode('hex'))
print(swap_endian_word(sha256d(header_bin).encode('hex')).encode('hex'))
