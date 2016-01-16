# # # coding: utf-8
CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "NOb8gE7G8SejcIJAkyWWDyGRotFpG2mprug3m5GD"
  config.qiniu_secret_key    = 'Z7kTUVEUYT9Mr2MuNyheHMLlAiVLE7n11H_dJasW'
  config.qiniu_bucket        = "dongfeng"
  config.qiniu_bucket_domain = "dongfeng.qiniudn.com"
  config.qiniu_bucket_private = false #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
end