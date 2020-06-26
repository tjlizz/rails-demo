# 创建数据库
 ```
 bin/rails db:create
 ```

密码加密 :has_secure_password
 
数据库密码字段：password_digest

接收密码字段:password

秘密缺人字段:password_confirmation
# 创建model
```  shell script
  rails g model People  name:string    # 创建model

  rails db:migrate # 映射数据库
```
