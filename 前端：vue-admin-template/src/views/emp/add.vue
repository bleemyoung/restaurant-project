<template>
    <div class="app-container">
        <el-form ref="form" :model="form" label-width="80px">
  <el-form-item label="职工姓名">
    <el-input type="textarea" v-model="emp.ename"></el-input>
  </el-form-item>
  <el-form-item label="职工工作">
    <el-input type="textarea" v-model="emp.job"></el-input>
  </el-form-item>
  <el-form-item label="职工工资">
    <el-input type="textarea" v-model="emp.sal"></el-input>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">立即创建</el-button>
    <el-button>取消</el-button>
  </el-form-item>
</el-form>
    </div>
</template>

<script>
import { add } from '@/api/emp'

  export default {
    data() {
      return {
        emp: {
          ename: '',
          job: '',
          sal: ''
        }
      }
    },
    methods: {
      onSubmit() {
        add(this.emp).then(response=>{
          // 提示信息
          this.$message({
              type: 'success',
              message: '添加成功!'
            });
            // 跳转到列表页
            this.$router.push({path:"/emp/list"})
        })
      }
    }
  }
</script>