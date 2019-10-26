menu_majority <- tabItem(tabName = "majority",
                         fluidRow(
                           column(width = 4,
                                  box(
                                    title = "品牌选择", width = NULL, solidHeader = TRUE, status = "primary",
                                    mdl_ListChoose1('blcalc_brand','品牌选择',
                                                    choiceNames = vect_as_list(brand_name),
                                                    choiceValues = vect_as_list(brand_number),
                                                    selected = 'JBLH'
                                    )
                                  ),
                                  box(
                                    title = "获取版号", width = NULL, solidHeader = TRUE, status = "primary",
                                    actionButton('bl_getVersion','获取最新版本')
                                    
                                    
                                  ),
                                  box(
                                    title = "T", width = NULL, solidHeader = TRUE, status = "primary",
                                    actionButton('bl_execCalc','执行黑名单运算(版本化)')
                                  )
                           )
                         )
)