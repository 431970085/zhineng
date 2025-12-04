<template>
    <div>
        <div class="container">
            <div class="handle-box">
                <el-input v-model="query.keyword" placeholder="搜索内容" size="mini" style="width: 15%;min-width: 100px;" class="handle-input mr10"></el-input>
                <el-button type="primary" icon="el-icon-search" size="mini" @click="handleSearch">搜索</el-button>
                <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAdd">添加</el-button>
            </div>
            <el-table :data="tableData" size="mini" border class="table" ref="multipleTable" header-cell-class-name="table-header">
                                            <el-table-column prop="id" label="编号"></el-table-column>
                            <el-table-column prop="title" label="课程名称"></el-table-column>
                            <el-table-column prop="outline" label="课程详情"></el-table-column>
                        <el-table-column label="课程主图(查看大图)" align="center">
                            <template #default="scope">
                                <el-image class="table-td-thumb" :src="scope.row.picurl" :preview-src-list="[scope.row.picurl]">
                                </el-image>
                            </template>
                        </el-table-column>
                            <el-table-column prop="type" label="课程类型"></el-table-column>
                            <el-table-column v-if="false" prop="content" label="课程内容"></el-table-column>
                            <el-table-column prop="hits" label="浏览量"></el-table-column>
                            <el-table-column prop="state" label="课程状态"></el-table-column>
                            <el-table-column prop="intro" label="课程备注"></el-table-column>
                            <el-table-column prop="createtime" label="创建时间"></el-table-column>
                            <el-table-column prop="nums" label="课程价格"></el-table-column>
                            <el-table-column prop="adduser" label="创建用户"></el-table-column>
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
                                <el-form-item label="课程名称:">
                                    <el-input placeholder="请输入课程名称" v-model="form.title">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="课程详情:">
                                    <el-input placeholder="请输入课程详情" v-model="form.outline">
                                    </el-input>
                                </el-form-item>
                            <el-form-item label="课程主图:">
                                <el-input placeholder="请输入课程主图" style="width: 80%;display: inline-block;" v-model="form.picurl">
                                </el-input>
                                <el-upload action="" :show-file-list="false" :on-error="handleAvatarError"
                                           :on-success="handleAvatarSuccess" :before-upload="handleAvatarBeforeUpload"
                                           :http-request="uploadSectionFile" style="display: inline-block;">
                                    <el-button type="primary" style="margin: 0px;padding: 0px 8px;">选择文件</el-button>
                                </el-upload>
                            </el-form-item>
                                <el-form-item label="课程类型:">
                                    <el-input placeholder="请输入课程类型" v-model="form.type">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="课程内容:" prop="content">
                                    <el-input type="textarea" placeholder="请输入课程内容" rows="5" v-model="form.content"></el-input>
                                </el-form-item>
                                <el-form-item label="浏览量:">
                                    <el-input placeholder="请输入浏览量" v-model="form.hits">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="课程状态:">
                                    <el-input placeholder="请输入课程状态" v-model="form.state">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="课程备注:">
                                    <el-input placeholder="请输入课程备注" v-model="form.intro">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="创建时间:">
                                    <el-input placeholder="请输入创建时间" v-model="form.createtime">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="课程价格:">
                                    <el-input placeholder="请输入课程价格" v-model="form.nums">
                                    </el-input>
                                </el-form-item>
                                <el-form-item label="创建用户:">
                                    <el-input placeholder="请输入创建用户" v-model="form.adduser">
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
                        <el-form-item label="编号:">
                            <el-input placeholder="请输入编号" :disabled="true" v-model="form.id">
                            </el-input>
                        </el-form-item>
                                <el-form-item label="课程名称:">
                                    <el-input placeholder="请输入课程名称" v-model="form.title">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="课程详情:">
                                    <el-input placeholder="请输入课程详情" v-model="form.outline">
                                    </el-input>
                                </el-form-item>

                            <el-form-item label="课程主图:">
                                <el-input placeholder="请输入课程主图" style="width: 80%;display: inline-block;" v-model="form.picurl">
                                </el-input>
                                <el-upload action="" :show-file-list="false" :on-error="handleAvatarError"
                                           :on-success="handleAvatarSuccess" :before-upload="handleAvatarBeforeUpload"
                                           :http-request="uploadSectionFile" style="display: inline-block;">
                                    <el-button type="primary" style="margin: 0px;padding: 0px 8px;">选择文件</el-button>
                                </el-upload>
                            </el-form-item>

                                <el-form-item label="课程类型:">
                                    <el-input placeholder="请输入课程类型" v-model="form.type">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="课程内容:" prop="content">
                                    <el-input type="textarea" placeholder="请输入课程内容" rows="5" v-model="form.content"></el-input>
                                </el-form-item>

                                <el-form-item label="浏览量:">
                                    <el-input placeholder="请输入浏览量" v-model="form.hits">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="课程状态:">
                                    <el-input placeholder="请输入课程状态" v-model="form.state">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="课程备注:">
                                    <el-input placeholder="请输入课程备注" v-model="form.intro">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="创建时间:">
                                    <el-input placeholder="请输入创建时间" v-model="form.createtime">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="课程价格:">
                                    <el-input placeholder="请输入课程价格" v-model="form.nums">
                                    </el-input>
                                </el-form-item>

                                <el-form-item label="创建用户:">
                                    <el-input placeholder="请输入创建用户" v-model="form.adduser">
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
        name: "datainfotable",
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
                        this.form.picurl = imgurl;
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
                var sql = " select * from datainfo  ";
                if (keyword != '') {
                    pageNum = 1;
                    sql = "select * from datainfo where title like '%" + keyword + "%'  ";
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
                        var deleteid = row.id;
                        var data = {"sql": "delete  from datainfo where  id='" + deleteid + "' "}
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
                id: "",
                title: "",
                outline: "",
                picurl: "",
                type: "",
                content: "",
                hits: "",
                state: "",
                intro: "",
                createtime: "",
                nums: "",
                adduser: "",
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
                form.createtime = getNowTime();
            };
            const saveInsert = () => {
                addVisible.value = false;
                var that = this;
                var obj = form;
                if (obj.id == '') {
                    obj.id = 0;
                }
                var data = {"sql": `insert into datainfo (id,title,outline,picurl,type,content,hits,state,intro,createtime,nums,adduser)  values ('${obj.id}','${obj.title}','${obj.outline}','${obj.picurl}','${obj.type}','${obj.content}','${obj.hits}','${obj.state}','${obj.intro}','${obj.createtime}','${obj.nums}','${obj.adduser}')`}
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
                var data = {"sql": `  update datainfo set title = '${obj.title}',outline = '${obj.outline}',picurl = '${obj.picurl}',type = '${obj.type}',content = '${obj.content}',hits = '${obj.hits}',state = '${obj.state}',intro = '${obj.intro}',createtime = '${obj.createtime}',nums = '${obj.nums}',adduser = '${obj.adduser}'  where id = '${obj.id}'  `}
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

