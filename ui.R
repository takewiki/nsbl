


# 1.00  shinyUI start point----

shinyUI(dashboardPage(skin = "blue",
                    
                
                    
                    dashboardHeader(title = app_title,
                                   
                                    headerMsg1,
                                    dynamicMsgMenu,
                                   # NotiMenuObj,
                                    disable = F
                    ),
                    
                    #ui.sideBar----
                    dashboardSidebar(
                    
                       sidebarMenu,
                       tsui::use_pop()
                    ),
                    
                    #ui.body----
                    dashboardBody(
                      workAreaSetting
                    )
)
)


