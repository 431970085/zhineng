<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="8">
        <el-card shadow="hover" class="mgb20" style="height:252px;">
          <div class="user-info">
            <img :src="loginAdmin.headimg" class="user-avator" alt/>
            <div class="user-info-cont">
              <div class="user-info-name">{{ loginAdmin.adminname }}</div>
              <div>{{ loginAdmin.role }}</div>
            </div>
          </div>
          <div class="user-info-list">
            创建时间：
            <span>{{ loginAdmin.admincreatetime }}</span>
          </div>
          <div class="user-info-list">
            账号状态：
            <span>{{ loginAdmin.islock }}</span>
          </div>
        </el-card>
        <el-card shadow="hover" style="height:252px;">
          <template #header>
            <div class="clearfix">
              <span>语言详情</span>
            </div>
          </template>
          Vue
          <el-progress :percentage="71.3" color="#42b983"></el-progress>
          JavaScript
          <el-progress :percentage="24.1" color="#f1e05a"></el-progress>
          CSS
          <el-progress :percentage="13.7"></el-progress>
          HTML
          <el-progress :percentage="5.9" color="#f56c6c"></el-progress>
          Springboot
          <el-progress :percentage="60" color="#f56c6c"></el-progress>
        </el-card>
      </el-col>
      <el-col :span="16">
        <el-row :gutter="20" class="mgb20">
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{ padding: '0px' }">
              <div class="grid-content grid-con-1">
                <i class="el-icon-user-solid grid-con-icon"></i>
                <div class="grid-cont-right">
                  <div class="grid-num">{{ tableData.userinfo }}</div>
                  <div>用户数量</div>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{ padding: '0px' }">
              <div class="grid-content grid-con-2">
                <i class="el-icon-message-solid grid-con-icon"></i>
                <div class="grid-cont-right">
                  <div class="grid-num">{{ tableData.noticeinfo }}</div>
                  <div>系统消息</div>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{ padding: '0px' }">
              <div class="grid-content grid-con-3">
                <i class="el-icon-s-goods grid-con-icon"></i>
                <div class="grid-cont-right">
                  <div class="grid-num">{{ tableData.datainfo }}</div>
                  <div>内容数量</div>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
        <el-card shadow="hover" style="height:403px;">
          <template #header>
            <div class="clearfix">
              <span>系统公告</span>
              <el-button style="float: right; padding: 3px 0px;color: #409EFF;" type="text">
                <router-link :to="`NoticeinfoTable`">详情
                </router-link>
              </el-button>
            </div>
          </template>

          <el-table :show-header="false" :data="tableContent" style="width:100%;">
            <el-table-column width="40">
              <template #default="scope">
                <el-checkbox></el-checkbox>
              </template>
            </el-table-column>
            <el-table-column>
              <template #default="scope">
                <div class="todo-item">{{ scope.row.noticetitle }}
                </div>
              </template>
            </el-table-column>
            <el-table-column width="60">
              <template>
                <i class="el-icon-edit"></i>
                <i class="el-icon-delete"></i>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card shadow="hover">
          <schart ref="bar" class="schart" canvasId="bar" :options="options"></schart>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card shadow="hover">
          <schart ref="pie" class="schart" canvasId="pie" :options="options2"></schart>
        </el-card>
      </el-col>
    </el-row>
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

import Schart from "../components/SchartWrapper.vue";
//引入请求 request
import request from '../utils/request';

export default {
  name: "dashboard",
  components: {
    Schart
  },
  setup() {

    const tableData = ref({});
    const tableContent = ref([]);
    // 获取系统数据
    const getSystemData = () => {
      request({
        url: '/selectAction',
        method: 'get',
        params: {
          sql: `
                            SELECT (SELECT COUNT(*) FROM userinfo)    AS userinfo,
                                   (SELECT COUNT(*) FROM noticeinfo) AS noticeinfo,
                                   (SELECT COUNT(*) FROM datainfo)    AS datainfo
                          `
        },
      }).then((res) => {
        tableData.value = res.data[0]; //数据
      });
      request({
        url: '/selectAction',
        method: 'get',
        params: {
          sql: 'SELECT * FROM noticeinfo'
        },
      }).then((res) => {
        tableContent.value = res.data; //数据
      });
    };


    getSystemData();


    const name = localStorage.getItem("ms_username");
    const loginAdmin = JSON.parse(localStorage.getItem("loginAdmin"));
    const role = name === "admin" ? "超级管理员" : "普通用户";

    const data = reactive([]);

    const namesArray = ref([]); //名称
    const valsArray = ref([]); //数值
    // 获取表格数据
    const getCountData = () => {
      request({
        url: '/selectAction',
        method: 'get',
        params: {
          "sql": "select sex as name,count(*) as val from userinfo group by  sex"
        }
      }).then((res) => {
        for (var i = 0; i < res.data.length; i++) {
          var obj = res.data[i];
          namesArray.value.push(obj.name);
          valsArray.value.push(obj.val);
        }
      });
    };

    getCountData(); //调用方法
    console.log(namesArray.value);
    console.log(valsArray.value);

    //柱状图
    const options = {
      type: "bar",
      title: {
        text: "男女性别分析",
      },
      bgColor: "#fbfbfb",
      labels: namesArray.value,
      datasets: [{
        label: "性别分析",
        fillColor: "rgba(241, 49, 74, 0.5)",
        data: valsArray.value,
      }],
    };


    const namesArray2 = ref([]); //名称
    const valsArray2 = ref([]); //数值
    // 获取表格数据
    const getCountData2 = () => {
      request({
        url: '/selectAction',
        method: 'get',
        params: {
          "sql": "select age as name,count(*) as val from userinfo group by  age"
        }
      }).then((res) => {
        for (var i = 0; i < res.data.length; i++) {
          var obj = res.data[i];
          namesArray2.value.push(obj.name + "岁");
          valsArray2.value.push(obj.val);
        }
      });
    };

    getCountData2(); //调用方法

    //柱状图
    const options2 = {
      type: "pie",
      title: {
        text: "年龄信息统计",
      },
      bgColor: "#fbfbfb",
      labels: namesArray2.value,
      datasets: [{
        label: "年龄信息",
        fillColor: "rgba(241, 49, 74, 0.5)",
        data: valsArray2.value,
      }],
    };

    const todoList = reactive([]);

    return {
      name,
      loginAdmin,
      tableData,
      tableContent,
      data,
      options,
      options2,
      todoList,
      role,
    };
  },
};
</script>

<style scoped>
.el-row {
  margin-bottom: 20px;
}

.grid-content {
  display: flex;
  align-items: center;
  height: 100px;
}

.grid-cont-right {
  flex: 1;
  text-align: center;
  font-size: 14px;
  color: #999;
}

.grid-num {
  font-size: 30px;
  font-weight: bold;
}

.grid-con-icon {
  font-size: 50px;
  width: 100px;
  height: 100px;
  text-align: center;
  line-height: 100px;
  color: #fff;
}

.grid-con-1 .grid-con-icon {
  background: rgb(45, 140, 240);
}

.grid-con-1 .grid-num {
  color: rgb(45, 140, 240);
}

.grid-con-2 .grid-con-icon {
  background: rgb(100, 213, 114);
}

.grid-con-2 .grid-num {
  color: rgb(45, 140, 240);
}

.grid-con-3 .grid-con-icon {
  background: rgb(242, 94, 67);
}

.grid-con-3 .grid-num {
  color: rgb(242, 94, 67);
}

.user-info {
  display: flex;
  align-items: center;
  padding-bottom: 20px;
  border-bottom: 2px solid #ccc;
  margin-bottom: 20px;
}

.user-avator {
  width: 120px;
  height: 120px;
  border-radius: 50%;
}

.user-info-cont {
  padding-left: 50px;
  flex: 1;
  font-size: 14px;
  color: #999;
}

.user-info-cont div:first-child {
  font-size: 30px;
  color: #222;
}

.user-info-list {
  font-size: 14px;
  color: #999;
  line-height: 25px;
}

.user-info-list span {
  margin-left: 70px;
}

.mgb20 {
  margin-bottom: 20px;
}

.todo-item {
  font-size: 14px;
}

.todo-item-del {
  text-decoration: line-through;
  color: #999;
}

.schart {
  width: 100%;
  height: 300px;
}
</style>
