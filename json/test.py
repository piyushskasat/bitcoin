import binascii
import hashlib
import sys
import subprocess
import calendar

from blockchain_parser.blockchain import Blockchain


# Convert from/to binary and hexidecimal strings (could be replaced with .encode('hex') and .decode('hex'))
hexlify = binascii.hexlify
unhexlify = binascii.unhexlify

def sha256(message):
  '''Single SHA256 Hashing function.'''
  return hashlib.sha256(message).digest()


def sha256d(message):
  '''Double SHA256 Hashing function.'''
  return sha256(sha256(message))


def swap_endian_word(hex_word):
  '''Swaps the endianness of a hexidecimal string of a word and converts to a binary string.'''
  message = unhexlify(hex_word)
  if len(message) % 4 != 0: raise ValueError('Must be 4-byte word aligned')
  return message[::-1]

#version     = "20000000"
#prev_hash   = "0000000000000000005858d63912f89e244f83d138b4e0b00b54430b2877a57c"
#merkle_root = "cca6efe8483e81a28ed7fc2db1439d34d2224991de81ed73233a8cb613750423"
#ntime       = "5A131A38"
#nbits       = "1800CE4B"
#nonce       = "D07712D9"


# Instantiate the Blockchain by giving the path to the directory 
# containing the .blk files created by bitcoind
blockchain = Blockchain("/home/arsen/.bitcoin/blocks")

# output file for test vectors
f = open('sha256_testvectors.txt','a')

for block in blockchain.get_unordered_blocks():
  version     = "0000000" + str(block.header.version)
  prev_hash   = block.header.previous_block_hash
  merkle_root = block.header.merkle_root
  ntime       = format(int(calendar.timegm(block.header.timestamp.timetuple())), '08x')
  nbits       = format(block.header.bits, '08x')
  nonce       = format(block.header.nonce, '08x')

  header_bin = swap_endian_word(version) + swap_endian_word(prev_hash) + swap_endian_word(merkle_root) + swap_endian_word(ntime) + swap_endian_word(nbits) + swap_endian_word(nonce)

  if (swap_endian_word(sha256d(header_bin).encode('hex')).encode('hex') != block.hash):
    print "mismatch in calculated hash vs block.hash"
    break
  else:
    f.write(hexlify(header_bin))
    f.write('\n')
    f.write(str(block.hash))
    f.write('\n')
