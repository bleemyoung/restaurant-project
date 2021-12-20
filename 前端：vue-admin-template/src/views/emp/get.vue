<template>
    <div class="app-container">
        <el-form ref="form" :model="form" label-width="80px">
  <el-form-item label="要得到的职工序号">
    <el-input type="textarea" v-model="emp.empno"></el-input>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">得到职工</el-button>
    <el-button>取消</el-button>
  </el-form-item>
</el-form>
<h1>{{emp.empno}}</h1>
<h1>{{emp.ename}}</h1>
<h1>{{emp.job}}</h1>
<h1>{{emp.sal}}</h1>
    </div>
</template>

<script>
import { get } from '@/api/emp'

  export default {
    data() {
      return {
        emp: {
          empno: '',
        }
      }
    },
    methods: {
      onSubmit() {
        get(this.emp.empno).then(response=>{
          // 提示信息
          this.$message({
              type: 'success',
              message: '得到成功!'
            });
            console.log((response.data.emp))
            this.emp =  response.data.emp

            // 跳转到列表页
            //System.out.println("此职工序号："+response.empno+"此职工姓名："+response.ename)
            //this.$router.push({path:"/emp/list"})
        })
      }
    }
  }
</script>