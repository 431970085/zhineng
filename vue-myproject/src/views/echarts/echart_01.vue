<template>
  <div ref="echarts_Chart" style="width: 98%; height: 600px;margin: 50px auto;"></div>
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
import * as echarts from 'echarts';
import request from '../../utils/request';

export default {
  name: 'echarts_Chart',
  mounted() {
    this.initecharts_Chart();
  },
  methods: {
    initecharts_Chart() {


      const namesArray = ref([]); //名称
      const valsArray = ref([]); //数值
      const beanArray = ref([]); //数值


      var sql = " select name as name,count(*) as val from studyinfo,userinfo where studyinfo.uid=userinfo.id group by name ";
      var data = {"sql": sql};
      request({
        url: '/selectAction',
        method: 'get',
        params: data
      }).then((res) => {
        console.log(res);
        for (var i = 0; i < res.data.length; i++) {
          var obj = res.data[i];
          namesArray.value.push(obj.name);
          valsArray.value.push(obj.val);
          beanArray.value.push({"name": obj.name, "value": obj.val});
        }


        // 基于准备好的dom，初始化echarts实例
        const myChart = echarts.init(this.$refs.echarts_Chart);

        // 指定图表的配置项和数据
        var option = {
          title: {
            text: '用户学习次数统计',
            x: 'center',
            y: '7px',
            textStyle: {
              color: '#3A7BD5',
              fontSize: 20
            },
            textAlign: 'left'
          },
          //工具箱，每个图表最多仅有一个工具箱
          toolbox: {
            orient: "vertical", //纵向显示
            //显示策略，可选为：true（显示） | false（隐藏），默认值为false
            show: true,
            //启用功能，目前支持feature，工具箱自定义功能回调处理
            feature: {
              //辅助线标志
              mark: {show: true},
              //数据视图，打开数据视图，可设置更多属性,readOnly 默认数据视图为只读(即值为true)，可指定readOnly为false打开编辑功能
              dataView: {show: true, readOnly: true},
              //magicType，动态类型切换，支持直角系下的折线图、柱状图、堆积、平铺转换
              magicType: {show: true, type: ['line', 'bar']},
              //restore，还原，复位原始图表
              restore: {show: true},
              //saveAsImage，保存图片（IE8-不支持）,图片类型默认为'png'
              saveAsImage: {show: true}
            }
          },
          /*鼠标移入显示文字*/
          tooltip: {
            trigger: 'item',
            show: true,
            formatter: "{a} {b}: {c}"
          },
          legend: {
            data: ['用户']
          },
          xAxis: {
            name: "姓名",
            data: namesArray.value,
            axisLabel: {
              // 设置 x 轴标签的倾斜角度，这里设置为 45 度
              rotate: 45
            }
          },
          yAxis: {
            name: "数量",
          },
          series: [{
            name: '数量',
            type: 'bar',
            data: valsArray.value
          }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
      });
    }
  }
}
</script>
