module AesUtil
  #加密
  def self.aes_encrypt(key, encrypted_string)
    aes = OpenSSL::Cipher::Cipher.new("AES-128-ECB")
    aes.encrypt
    aes.key = key
    txt = aes.update(encrypted_string) << aes.final
    txt.unpack('H*')[0].upcase
  end

  #解密
  def self.aes_dicrypt(key, dicrypted_string)
    aes = OpenSSL::Cipher::Cipher.new("AES-128-ECB")
    aes.decrypt
    aes.key = key
    aes.update([dicrypted_string].pack('H*')) << aes.final
  end
end