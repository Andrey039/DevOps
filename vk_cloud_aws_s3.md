По пути ~/.aws/ создать файлы
config
```
[default]
region = ru-msk
output = json
s3 =
    max_concurrent_requests = 20
    max_queue_size = 10000
    multipart_threshold = 1024MB
    multipart_chunksize = 384MB
    addressing_style = path
```
credentials
```
[default]
aws_access_key_id = xxxxxxxxxxxxxx
aws_secret_access_key = xxxxxxxxxxxxx
```

Загрузить файл в бакет  ``` aws s3 cp /123 s3://bucket_name  --endpoint-url https://hb.ru-msk.vkcs.cloud ```

Создать временную ссылку общего доступа  ``` aws s3 presign s3://bucket_name/file_name --endpoint-url https://hb.ru-msk.vkcs.cloud  --expires-in 180 ```
