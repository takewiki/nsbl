menu_column <- tabItem(tabName = "column",
                       fluidRow(
                         column(width = 4,
                                box(
                                  title = "选择文件", width = NULL, solidHeader = TRUE, status = "primary",
                                  mdl_file('bl_ques_sel','选择问题级黑名单文件')
                                ),
                                box(
                                  title = "品牌选择区", width = NULL, solidHeader = TRUE, status = "primary",
                                  mdl_ListChoose1('ques_brand','品牌选择',
                                                  choiceNames = vect_as_list(brand_name),
                                                  choiceValues = vect_as_list(brand_number),
                                                  selected = 'JBLH'
                                  )
                                ),
                                box(
                                  title = "操作区域", width = NULL, solidHeader = TRUE, status = "primary",
                                  actionButton('nsbl_ques_preview','预览内容'),
                                  actionButton('nsbl_ques_upload','上传服务器')
                                )
                         ),
                         
                         column(width = 8,
                                box(
                                  title = "文件级结果预览", width = NULL, solidHeader = TRUE, status = "primary",
                                  mdl_dataTable('bl_ques_data_show')
                                )
                         )
                       )
)