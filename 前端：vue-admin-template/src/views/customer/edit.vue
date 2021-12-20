<template>
  <div class="app-container">
  <el-form ref="form" :model="stu" label-width="80px">
<el-form-item label="id">
    <el-input v-model="stu.id"></el-input>
  </el-form-item>
  <el-form-item label="姓名">
    <el-input v-model="stu.name"></el-input>
  </el-form-item>
  <el-form-item label="语文">
    <el-input v-model="stu.chinese"></el-input>
  </el-form-item>
  <el-form-item label="数学">
    <el-input v-model="stu.math"></el-input>
  </el-form-item>
  <el-form-item label="科学">
    <el-input v-model="stu.science"></el-input>
  </el-form-item>
  <el-form-item label="英语">
    <el-input v-model="stu.english"></el-input>
  </el-form-item>
  <el-form-item>
    <el-button type="primary" :disabled="disable" @click="onSubmit">保存</el-button>
  </el-form-item>
  </el-form>
 </div>
</template>
<script>
import {addStu,update,getStu, getMenu, addDish} from '@/api/customer'
export default {
    data() {
      return {
        dishes:{
          id:'',
          name:'',
          price:'',
          information:'',
          isfinished:'',
          number:''
      },
        disable:false
      }
    },
    created(){
      if(this.$route.params && this.$route.params.id){
        this.getInfo(this.$route.params.id)
      }
    },
  
    methods: {
      onSubmit() {
      
          this.addInfo(this.stu)
        
      },
      getInfo(id){
        getMenu(id).then(response=>{
          this.dishes = response.data.dishes
        })
      },
      addInfo(){
        addDish(this.stu).then(response=>{
          // 提示信息
          this.$message({
              type: 'success',
              message: '添加成功!'
            });
            // 跳转到列表页
            this.$router.push({path:"/stu/show"})
        })
      }
      
     
    }
  
  }
</script>

