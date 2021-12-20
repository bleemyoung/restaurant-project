<template>
    <div class="app-container">
        <el-form ref="form" :model="form" label-width="80px">
  <el-form-item label="要删除的职工序号">
    <el-input type="textarea" v-model="emp.empno"></el-input>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">立即删除</el-button>
    <el-button>取消</el-button>
  </el-form-item>
</el-form>
    </div>
</template>

<script>
import { delEmps } from '@/api/emp'
  export default {
    data() {
      return {
        emp: {
          empno: ''
        }
      }
    },
    methods: {
      onSubmit() {
        delEmps(this.emp.empno).then(response=>{
          // 提示信息
          this.$message({
              type: 'success',
              message: '删除成功!'
            });
            // 跳转到列表页
            this.$router.push({path:"/emp/list"})
        })
      }
    }
  }
</script>