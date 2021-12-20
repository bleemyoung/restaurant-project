<template>
    <div class="app-container">
        <el-form ref="form" :model="form" label-width="80px">
  <el-form-item label="公告内容">
    <el-input type="textarea" v-model="notice.content"></el-input>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" @click="onSubmit">立即创建</el-button>
    <el-button>取消</el-button>
  </el-form-item>
</el-form>
    </div>
</template>

<script>
import { add } from '@/api/notice'

  export default {
    data() {
      return {
        notice: {
        }
      }
    },
    methods: {
      onSubmit() {
        add(this.notice).then(response=>{
          // 提示信息
          this.$message({
              type: 'success',
              message: '添加成功!'
            });
            // 跳转到列表页
            this.$router.push({path:"/notice/list"})
        })
      }
    }
  }
</script>