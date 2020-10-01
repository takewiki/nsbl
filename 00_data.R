# 设置app标题-----
# 5.1

app_title <-'网商黑名单系统V5';

conn_nsim <-tsda::conn_nsim();
conn <-tsda::conn_nsim();
brand_number <- nsim_brand_FNumber()
brand_name <- nsim_brand_FName()


# 设置3条消息框------
msg <- list(
  list(from = "人力资源部1",
       message= "7月工资表已完成计算"),
  list(from="数据部2",
       message = "HR功能已更新到V2",
       icon = "question",
       time = "13:45"
       ),
  list(from = "技术支持3",
       message = "新的HR数据中台已上线.",
       icon = "life-ring",
       time = "2019-08-26"
       )
)



