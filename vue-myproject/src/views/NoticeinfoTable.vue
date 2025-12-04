<template>
    <div>
        <div class="container">
            <div class="handle-box">
                <el-input v-model="query.keyword" placeholder="搜索内容" size="mini" style="width: 15%;min-width: 100px;" class="handle-input mr10"></el-input>
                <el-button type="primary" icon="el-icon-search" size="mini" @click="handleSearch">搜索</el-button>
                <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAdd">添加</el-button>
            </div>
            <el-table :data="tableData" size="mini" border class="table" ref="multipleTable" header-cell-class-name="table-header">
                                            <el-table-column prop="noticeid" label="公告编号"></el-table-column>
                            <el-table-column prop="noticetitle" label="公告标题"></el-table-column>
                            <el-table-column prop="noticecontent" label="公告内容"></el-table-column>
                            <el-table-column prop="noticeaddtime" label="公告时间"></el-table-column>
                            <el-table-column prop="noticeremarker" label="公告备注"></el-table-column>
                <el-table-column label="操作" width="180" align="center">
                    <template #default="scope">
                        <el-button type="text" icon="el-icon-edit" @click="handleEdit(scope.$index, scope.row)">编辑
                        </el-button>
                        <el-button type="text" icon="el-icon-delete" class="red"
                                   @click="handleDelete(scope.$index, scope.row)">删除
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div class="pagination">
                <el-pagination background layout="total, prev, pager, next" :current-page="query.pageIndex"
                               :page-size="query.pageSize" :total="pageTotal" @current-change="handlePageChange"></el-pagination>
            </div>
        </div>

        <!-- 添加弹出框 -->
        <el-dialog title="添加" v-model="addVisible" width="45%">
            <el-form size="small" label-width="100px">
                                <el-form-item label="公告标题:">
                                    <el-input placeholder="请输入公告标题" v-model="form.noticetitle">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="公告内容:" prop="noticecontent">
                                    <el-input type="textarea" placeholder="请输入公告内容" rows="5" v-model="form.noticecontent"></el-input>
                                </el-form-item>
                                <el-form-item label="公告时间:">
                                    <el-input placeholder="请输入公告时间" v-model="form.noticeaddtime">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="公告备注:">
                                    <el-input placeholder="请输入公告备注" v-model="form.noticeremarker">
                                    </el-input>
                                </el-form-item>
            </el-form>
            <template #footer>
				<span class="dialog-footer">
					<el-button size="small" @click="addVisible = false">取 消</el-button>
					<el-button size="small" type="primary" @click="saveInsert">确 定</el-button>
				</span>
            </template>
        </el-dialog>


        <!-- 编辑弹出框 -->
        <el-dialog title="编辑" v-model="editVisible" width="45%">
            <el-form size="small" label-width="100px">
                        <el-form-item label="公告编号:">
                            <el-input placeholder="请输入公告编号" :disabled="true" v-model="form.noticeid">
                            </el-input>
                        </el-form-item>
                                <el-form-item label="公告标题:">
                                    <el-input placeholder="请输入公告标题" v-model="form.noticetitle">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="公告内容:" prop="noticecontent">
                                    <el-input type="textarea" placeholder="请输入公告内容" rows="5" v-model="form.noticecontent"></el-input>
                                </el-form-item>

                                <el-form-item label="公告时间:">
                                    <el-input placeholder="请输入公告时间" v-model="form.noticeaddtime">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="公告备注:">
                                    <el-input placeholder="请输入公告备注" v-model="form.noticeremarker">
                                    </el-input>
                                </el-form-item>

            </el-form>
            <template #footer>
				<span class="dialog-footer">
					<el-button size="small" @click="editVisible = false">取 消</el-button>
					<el-button size="small" type="primary" @click="saveEdit">确 定</el-button>
				</span>
            </template>
        </el-dialog>
    </div>
</template>

<script>
    import {
        ref,
        reactive
    } from "vue";
    import {
        ElMessage,
        ElMessageBox
    } from "element-plus";
    //引入请求 request
    import request from '../utils/request';


    export default {
        name: "noticeinfotable",
        methods: {
            //失败时的方法
            handleAvatarError(err) {
                ElMessage.error(err);
            },

            //成功时的方法 上传成功后的回调函数
            handleAvatarSuccess(response) {
                if (response.isSuccess) {
                    ElMessage.error(response.error);
                    return;
                }
                ElMessage.error(response.error);
            },

            // 上传前
            handleAvatarBeforeUpload(file) {

                return true; //取消文件类型验证
                // 校验
                let legalName = ["bmp", "gif", "jpg", "jpeg", "png"];
                // 拿到后缀名
                let name = file.name.substring(
                    file.name.lastIndexOf(".") + 1,
                    file.name.length
                );
                name = name.toLowerCase();
                if (legalName.includes(name)) {
                    // console.log(legalName.includes(name));
                } else {
                    ElMessage.error("文件格式不对，仅限图片文件");
                    return false;
                }
            },

            //上传
            uploadSectionFile(params) {
                let formData = new FormData();
                formData.append("file", params.file);
                formData.append("dataid", "11111"); //其他数据

                let that = this;
                request({
                    url: '/uploadFile',
                    method: 'post',
                    data: formData
                }).then((res) => {
                    // 上传成功后的处理
                    if (res.status === 200) {
                        ElMessage.success("上传成功");
                        let imgurl = res.data.url;
                        console.log(imgurl); //图片路径
                    } else {
                        ElMessage.error(res.msg || '上传失败');
                    }

                }, err => {
                    // 出现错误时的处理
                    ElMessage.error('文件上传失败');
                });


            },
        },
        setup() {
            const query = reactive({
                keyword: "",
                pageIndex: 1,
                pageSize: 10,
            });
            const tableData = ref([]);
            const pageTotal = ref(0);

            // 获取表格数据
            const getData = () => {
                var keyword = query.keyword;
                var pageNum = query.pageIndex;
                var pageSize = query.pageSize;
                var sql = " select * from noticeinfo  ";
                if (keyword != '') {
                    pageNum = 1;
                    sql = "select * from noticeinfo where noticetitle like '%" + keyword + "%'  ";
                }
                var data = {"sql": sql, "p": pageNum, "pageSize": pageSize};
                request({
                    url: '/selectPageAction',
                    method: 'get',
                    params: data
                }).then((res) => {
                    tableData.value = res.data.records; //数据
                    pageTotal.value = res.data.total || 10; //总条数
                });
            };
            getData();

            // 查询操作
            const handleSearch = () => {
                query.pageIndex = 1;
                getData();
            };
            // 分页导航
            const handlePageChange = (val) => {
                query.pageIndex = val;
                getData();
            };

            // 删除操作
            const handleDelete = (index, row) => {
                // 二次确认删除
                ElMessageBox.confirm("确定要删除吗？", "提示", {
                    type: "warning",
                })
                    .then(() => {
                        //执行删除操作 接口请求
                        var deleteid = row.noticeid;
                        var data = {"sql": "delete  from noticeinfo where  noticeid='" + deleteid + "' "}
                        request({
                            url: '/updateAction',
                            method: 'get',
                            params: data
                        }).then((res) => {
                            if (res.status === 200) {
                                ElMessage.success("删除成功");
                                getData(); // 重新查询数据
                            } else {
                                ElMessage.error(res.msg || '删除失败');
                            }
                        });

                        //tableData.value.splice(index, 1); //从表格中移除当前行
                    })
                    .catch(() => {
                    });
            };


            let form = reactive({
                noticeid: "",
                noticetitle: "",
                noticecontent: "",
                noticeaddtime: "",
                noticeremarker: "",
            });

            const clearMyForm = () => {
                //某一个对象清空vule值，保留key
                Object.keys(form).forEach((key) => (form[key] = ''))
                console.log("clear")
            };


            // 表格编辑时弹窗和保存
            const editVisible = ref(false);
            const addVisible = ref(false);


            //获取系统当前时间
            const getNowTime = () => {
                let date = new Date();
                let YY = date.getFullYear();
                let MM = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                let DD = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                let hh = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                let mm = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                let ss = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
                // 这里修改返回时间的格式
                return YY + "-" + MM + "-" + DD + " " + hh + ":" + mm + ":" + ss;
            };


            const handleAdd = () => {
                clearMyForm();//清空form的值
                addVisible.value = true;
                form.noticeaddtime = getNowTime();
            };
            const saveInsert = () => {
                addVisible.value = false;
                var that = this;
                var obj = form;
                if (obj.noticeid == '') {
                    obj.noticeid = 0;
                }
                var data = {"sql": `insert into noticeinfo (noticeid,noticetitle,noticecontent,noticeaddtime,noticeremarker)  values ('${obj.noticeid}','${obj.noticetitle}','${obj.noticecontent}','${obj.noticeaddtime}','${obj.noticeremarker}')`}
                //执行删除操作 接口请求
                request({
                    url: '/updateAction',
                    method: 'get',
                    params: data
                }).then((res) => {
                    if (res.status === 200) {
                        ElMessage.success("添加数据成功");
                        getData(); // 重新查询数据
                    } else {
                        ElMessage.error(res.msg || '添加数据失败');
                    }
                });
            };


            const handleEdit = (index, row) => {
                Object.keys(form).forEach((item) => {
                    form[item] = row[item];
                });
                editVisible.value = true;
            };
            const saveEdit = () => {
                editVisible.value = false;
                //执行删除操作 接口请求
                var that = this;
                var obj = form;
                var data = {"sql": `  update noticeinfo set noticetitle = '${obj.noticetitle}',noticecontent = '${obj.noticecontent}',noticeaddtime = '${obj.noticeaddtime}',noticeremarker = '${obj.noticeremarker}'  where noticeid = '${obj.noticeid}'  `}
                request({
                    url: '/updateAction',
                    method: 'get',
                    params: data
                }).then((res) => {
                    if (res.status === 200) {
                        ElMessage.success('修改数据成功');
                        getData(); // 重新查询数据
                        clearMyForm();//清空form的值
                    } else {
                        ElMessage.error(res.msg || '修改数据失败');
                    }
                });
            };

            return {
                query,
                tableData,
                pageTotal,
                editVisible,
                form,
                handleSearch,
                handlePageChange,
                handleDelete,
                handleEdit,
                saveEdit,
                addVisible,
                handleAdd,
                saveInsert
            };
        },
    };
</script>

<style scoped>
    .handle-box {
        margin-bottom: 20px;
    }

    .handle-select {
        width: 120px;
    }

    .handle-input {
        width: 300px;
        display: inline-block;
    }

    .table {
        width: 100%;
        font-size: 14px;
    }

    .red {
        color: #ff0000;
    }

    .mr10 {
        margin-right: 10px;
    }

    .table-td-thumb {
        display: block;
        margin: auto;
        width: 30px;
        height: 30px;
    }
</style>
<style>
    /* 文件上传css样式 不能加scoped */
    .el-upload {
        display: inline-block;
        width: 80px;
        height: auto;
        padding: 0px;
        margin: 0px;
    }

    .el-upload--text {
        padding: 0px;
        margin: 0px;
        border: 0px;
        overflow: inherit;
    }
</style>

