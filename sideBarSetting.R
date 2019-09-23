sidebarMenu <-sidebarMenu(
  

 menuItem("文件级黑名单",tabName = "row",icon=icon('clock')),
 menuItem("问题级黑名单",tabName = "column",icon=icon('history')),
 # 1.01 出差外出数据----
 menuItem("答案级黑名单",tabName = "book",icon=icon('plane')),
 menuItem("关键词删除",tabName = "series",icon=icon('car-side')),


  # 1.02 components ----
  # menuItem("majory", tabName = "majority", icon = icon("hourglass")),
  # #1.03 outPut----
  # menuItem(text = "tutor",tabName = "tutor",icon=icon("user-times")),


  # #1.05 system setting ----
  menuItem(text = "系统设置",tabName = "sysSetting",icon=icon("cog"),
           sidebarMenu(
             #1.05.01 settingParam----
             menuItem(text="数据库设置",tabName = "dbms",icon = icon("calendar-alt"))
             # ,
             # 1.05.02 settingUser----
             # menuItem(text="user",tabName = "user",icon = icon("user-friends"))
           ))
  
  
)
